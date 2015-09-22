
#############################################################
# This file was automatically generated on 2015-07-28.      #
#                                                           #
# Bindings Version 2.1.5                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generators git repository on tinkerforge.com       #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickIMUV2 - Full fledged AHRS with 9 degrees of freedom

=cut

package Tinkerforge::BrickIMUV2;

use strict;
use warnings;
use Carp;
use threads;
use threads::shared;
use parent 'Tinkerforge::Device';
use Tinkerforge::IPConnection;
use Tinkerforge::Error;

=head1 CONSTANTS

=over

=item DEVICE_IDENTIFIER

This constant is used to identify a IMU Brick 2.0.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 18;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a IMU Brick 2.0.

=cut

use constant DEVICE_DISPLAY_NAME => 'IMU Brick 2.0';

=item CALLBACK_ACCELERATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ACCELERATION callback.

=cut

use constant CALLBACK_ACCELERATION => 32;

=item CALLBACK_MAGNETIC_FIELD

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MAGNETIC_FIELD callback.

=cut

use constant CALLBACK_MAGNETIC_FIELD => 33;

=item CALLBACK_ANGULAR_VELOCITY

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANGULAR_VELOCITY callback.

=cut

use constant CALLBACK_ANGULAR_VELOCITY => 34;

=item CALLBACK_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TEMPERATURE callback.

=cut

use constant CALLBACK_TEMPERATURE => 35;

=item CALLBACK_LINEAR_ACCELERATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_LINEAR_ACCELERATION callback.

=cut

use constant CALLBACK_LINEAR_ACCELERATION => 36;

=item CALLBACK_GRAVITY_VECTOR

This constant is used with the register_callback() subroutine to specify
the CALLBACK_GRAVITY_VECTOR callback.

=cut

use constant CALLBACK_GRAVITY_VECTOR => 37;

=item CALLBACK_ORIENTATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ORIENTATION callback.

=cut

use constant CALLBACK_ORIENTATION => 38;

=item CALLBACK_QUATERNION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_QUATERNION callback.

=cut

use constant CALLBACK_QUATERNION => 39;

=item CALLBACK_ALL_DATA

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALL_DATA callback.

=cut

use constant CALLBACK_ALL_DATA => 40;

=item FUNCTION_GET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION => 1;

=item FUNCTION_GET_MAGNETIC_FIELD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAGNETIC_FIELD => 2;

=item FUNCTION_GET_ANGULAR_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANGULAR_VELOCITY => 3;

=item FUNCTION_GET_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE => 4;

=item FUNCTION_GET_ORIENTATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ORIENTATION => 5;

=item FUNCTION_GET_LINEAR_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LINEAR_ACCELERATION => 6;

=item FUNCTION_GET_GRAVITY_VECTOR

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_GRAVITY_VECTOR => 7;

=item FUNCTION_GET_QUATERNION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_QUATERNION => 8;

=item FUNCTION_GET_ALL_DATA

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA => 9;

=item FUNCTION_LEDS_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LEDS_ON => 10;

=item FUNCTION_LEDS_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LEDS_OFF => 11;

=item FUNCTION_ARE_LEDS_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ARE_LEDS_ON => 12;

=item FUNCTION_SAVE_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SAVE_CALIBRATION => 13;

=item FUNCTION_SET_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION_PERIOD => 14;

=item FUNCTION_GET_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION_PERIOD => 15;

=item FUNCTION_SET_MAGNETIC_FIELD_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MAGNETIC_FIELD_PERIOD => 16;

=item FUNCTION_GET_MAGNETIC_FIELD_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAGNETIC_FIELD_PERIOD => 17;

=item FUNCTION_SET_ANGULAR_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANGULAR_VELOCITY_PERIOD => 18;

=item FUNCTION_GET_ANGULAR_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANGULAR_VELOCITY_PERIOD => 19;

=item FUNCTION_SET_TEMPERATURE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TEMPERATURE_PERIOD => 20;

=item FUNCTION_GET_TEMPERATURE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE_PERIOD => 21;

=item FUNCTION_SET_ORIENTATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ORIENTATION_PERIOD => 22;

=item FUNCTION_GET_ORIENTATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ORIENTATION_PERIOD => 23;

=item FUNCTION_SET_LINEAR_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_LINEAR_ACCELERATION_PERIOD => 24;

=item FUNCTION_GET_LINEAR_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LINEAR_ACCELERATION_PERIOD => 25;

=item FUNCTION_SET_GRAVITY_VECTOR_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_GRAVITY_VECTOR_PERIOD => 26;

=item FUNCTION_GET_GRAVITY_VECTOR_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_GRAVITY_VECTOR_PERIOD => 27;

=item FUNCTION_SET_QUATERNION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_QUATERNION_PERIOD => 28;

=item FUNCTION_GET_QUATERNION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_QUATERNION_PERIOD => 29;

=item FUNCTION_SET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALL_DATA_PERIOD => 30;

=item FUNCTION_GET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA_PERIOD => 31;

=item FUNCTION_ENABLE_STATUS_LED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_STATUS_LED => 238;

=item FUNCTION_DISABLE_STATUS_LED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_STATUS_LED => 239;

=item FUNCTION_IS_STATUS_LED_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_STATUS_LED_ENABLED => 240;

=item FUNCTION_GET_PROTOCOL1_BRICKLET_NAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;

=item FUNCTION_GET_CHIP_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;

=item FUNCTION_RESET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RESET => 243;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;


=back

=head1 FUNCTIONS

=over

=item new()

Creates an object with the unique device ID *uid* and adds it to
the IP Connection *ipcon*.

=cut

sub new
{
	my ($class, $uid, $ipcon) = @_;

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 0]);

	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MAGNETIC_FIELD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANGULAR_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ORIENTATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_LINEAR_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_GRAVITY_VECTOR} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_QUATERNION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_LEDS_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_LEDS_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_ARE_LEDS_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SAVE_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MAGNETIC_FIELD_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MAGNETIC_FIELD_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANGULAR_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANGULAR_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TEMPERATURE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ORIENTATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ORIENTATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_LINEAR_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_LINEAR_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_GRAVITY_VECTOR_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_GRAVITY_VECTOR_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_QUATERNION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_QUATERNION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_MAGNETIC_FIELD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANGULAR_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_LINEAR_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_GRAVITY_VECTOR} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ORIENTATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_QUATERNION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_ENABLE_STATUS_LED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE_STATUS_LED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_STATUS_LED_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_ACCELERATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_MAGNETIC_FIELD} = 's s s';
	$self->{callback_formats}->{&CALLBACK_ANGULAR_VELOCITY} = 's s s';
	$self->{callback_formats}->{&CALLBACK_TEMPERATURE} = 'c';
	$self->{callback_formats}->{&CALLBACK_LINEAR_ACCELERATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_GRAVITY_VECTOR} = 's s s';
	$self->{callback_formats}->{&CALLBACK_ORIENTATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_QUATERNION} = 's s s s';
	$self->{callback_formats}->{&CALLBACK_ALL_DATA} = 's3 s3 s3 s3 s4 s3 s3 c C';

	bless($self, $class);

	return $self;
}


=item get_acceleration()

Returns the calibrated acceleration from the accelerometer for the 
x, y and z axis in 1/100 m/s².

If you want to get the acceleration periodically, it is recommended 
to use the callback :func:`Acceleration` and set the period with 
:func:`SetAccelerationPeriod`.

=cut

sub get_acceleration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION, [], '', 's s s');
}

=item get_magnetic_field()

Returns the calibrated magnetic field from the magnetometer for the 
x, y and z axis in 1/16 µT (Microtesla).

If you want to get the magnetic field periodically, it is recommended 
to use the callback :func:`MagneticField` and set the period with 
:func:`SetMagneticFieldPeriod`.

=cut

sub get_magnetic_field
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAGNETIC_FIELD, [], '', 's s s');
}

=item get_angular_velocity()

Returns the calibrated angular velocity from the gyroscope for the 
x, y and z axis in 1/16 °/s.

If you want to get the angular velocity periodically, it is recommended 
to use the callback :func:`AngularVelocity` and set the period with 
:func:`SetAngularVelocityPeriod`.

=cut

sub get_angular_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANGULAR_VELOCITY, [], '', 's s s');
}

=item get_temperature()

Returns the temperature of the IMU Brick. The temperature is given in 
°C. The temperature is measured in the core of the BNO055 IC, it is not the
ambient temperature

=cut

sub get_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE, [], '', 'c');
}

=item get_orientation()

Returns the current orientation (heading, roll, pitch) of the IMU Brick as Euler
angles in 1/16 degree. Note that Euler angles always experience a
`gimbal lock <https://en.wikipedia.org/wiki/Gimbal_lock>`__.

We recommend that you use quaternions instead.

The rotation angle has the following ranges:

* heading: 0° to 360°
* roll: -90° to +90°
* pitch: -180° to +180°

If you want to get the orientation periodically, it is recommended 
to use the callback :func:`Orientation` and set the period with 
:func:`SetOrientationPeriod`.

=cut

sub get_orientation
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ORIENTATION, [], '', 's s s');
}

=item get_linear_acceleration()

Returns the linear acceleration of the IMU Brick for the
x, y and z axis in 1/100 m/s².

The linear acceleration is the acceleration in each of the three
axis of the IMU Brick with the influences of gravity removed.

It is also possible to get the gravity vector with the influence of linear
acceleration removed, see :func:`GetGravityVector`.

If you want to get the linear acceleration periodically, it is recommended 
to use the callback :func:`LinearAcceleration` and set the period with 
:func:`SetLinearAccelerationPeriod`.

=cut

sub get_linear_acceleration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_LINEAR_ACCELERATION, [], '', 's s s');
}

=item get_gravity_vector()

Returns the current gravity vector of the IMU Brick for the
x, y and z axis in 1/100 m/s².

The gravity vector is the acceleration that occurs due to gravity.
Influences of additional linear acceleration are removed.

It is also possible to get the linear acceleration with the influence 
of gravity removed, see :func:`GetLinearAcceleration`.

If you want to get the gravity vector periodically, it is recommended 
to use the callback :func:`GravityVector` and set the period with 
:func:`SetGravityVectorPeriod`.

=cut

sub get_gravity_vector
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_GRAVITY_VECTOR, [], '', 's s s');
}

=item get_quaternion()

Returns the current orientation (w, x, y, z) of the IMU Brick as
`quaternions <https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation>`__.

You have to divide the returns values by 16383 (14 bit) to get
the usual range of -1.0 to +1.0 for quaternions.

If you want to get the quaternions periodically, it is recommended 
to use the callback :func:`Quaternion` and set the period with 
:func:`SetQuaternionPeriod`.

=cut

sub get_quaternion
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_QUATERNION, [], '', 's s s s');
}

=item get_all_data()

Return all of the available data of the IMU Brick.

* acceleration in 1/100 m/s² (see :func:`GetAcceleration`)
* magnetic field in 1/16 µT (see :func:`GetMagneticField`)
* angular velocity in 1/16 °/s (see :func:`GetAngularVelocity`)
* Euler angles in 1/16 ° (see :func:`GetOrientation`)
* quaternion 1/16383 (see :func:`GetQuaternion`)
* linear acceleration 1/100 m/s² (see :func:`GetLinearAcceleration`)
* gravity vector 1/100 m/s² (see :func:`GetGravityVector`)
* temperature in 1 °C (see :func:`GetTemperature`)
* calibration status (see below)

The calibration status consists of four pairs of two bits. Each pair
of bits represents the status of the current calibration.

* bit 0-1: Magnetometer
* bit 2-3: Accelerometer
* bit 4-5: Gyroscope
* bit 6-7: System

A value of 0 means for "not calibrated" and a value of 3 means
"fully calibrated". In your program you should always be able to
ignore the calibration status, it is used by the calibration
window of the Brick Viewer and it can be ignored after the first
calibration. See the documentation in the calibration window for
more information regarding the calibration of the IMU Brick.

If you want to get the data periodically, it is recommended 
to use the callback :func:`AllData` and set the period with 
:func:`SetAllDataPeriod`.

=cut

sub get_all_data
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALL_DATA, [], '', 's3 s3 s3 s3 s4 s3 s3 c C');
}

=item leds_on()

Turns the orientation and direction LEDs of the IMU Brick on.

=cut

sub leds_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LEDS_ON, [], '', '');
}

=item leds_off()

Turns the orientation and direction LEDs of the IMU Brick off.

=cut

sub leds_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LEDS_OFF, [], '', '');
}

=item are_leds_on()

Returns *true* if the orientation and direction LEDs of the IMU Brick
are on, *false* otherwise.

=cut

sub are_leds_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_ARE_LEDS_ON, [], '', 'C');
}

=item save_calibration()

A call of this function saves the current calibration to be used
as a starting point for the next restart of continuous calibration
of the IMU Brick.

A return value of *true* means that the calibration could be used and
*false* means that it could not be used (this happens if the calibration 
status is not "fully calibrated").

This function is used by the calibration window of the Brick Viewer, you
should not need to call it in your program.

=cut

sub save_calibration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_SAVE_CALIBRATION, [], '', 'C');
}

=item set_acceleration_period()

Sets the period in ms with which the :func:`Acceleration` callback is triggered
periodically. A value of 0 turns the callback off.

The default value is 0.

=cut

sub set_acceleration_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION_PERIOD, [$period], 'L', '');
}

=item get_acceleration_period()

Returns the period as set by :func:`SetAccelerationPeriod`.

=cut

sub get_acceleration_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION_PERIOD, [], '', 'L');
}

=item set_magnetic_field_period()

Sets the period in ms with which the :func:`MagneticField` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_magnetic_field_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_MAGNETIC_FIELD_PERIOD, [$period], 'L', '');
}

=item get_magnetic_field_period()

Returns the period as set by :func:`SetMagneticFieldPeriod`.

=cut

sub get_magnetic_field_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAGNETIC_FIELD_PERIOD, [], '', 'L');
}

=item set_angular_velocity_period()

Sets the period in ms with which the :func:`AngularVelocity` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_angular_velocity_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, [$period], 'L', '');
}

=item get_angular_velocity_period()

Returns the period as set by :func:`SetAngularVelocityPeriod`.

=cut

sub get_angular_velocity_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, [], '', 'L');
}

=item set_temperature_period()

Sets the period in ms with which the :func:`Temperature` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_temperature_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_TEMPERATURE_PERIOD, [$period], 'L', '');
}

=item get_temperature_period()

Returns the period as set by :func:`SetTemperaturePeriod`.

=cut

sub get_temperature_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE_PERIOD, [], '', 'L');
}

=item set_orientation_period()

Sets the period in ms with which the :func:`Orientation` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_orientation_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ORIENTATION_PERIOD, [$period], 'L', '');
}

=item get_orientation_period()

Returns the period as set by :func:`SetOrientationPeriod`.

=cut

sub get_orientation_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ORIENTATION_PERIOD, [], '', 'L');
}

=item set_linear_acceleration_period()

Sets the period in ms with which the :func:`LinearAcceleration` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_linear_acceleration_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_LINEAR_ACCELERATION_PERIOD, [$period], 'L', '');
}

=item get_linear_acceleration_period()

Returns the period as set by :func:`SetLinearAccelerationPeriod`.

=cut

sub get_linear_acceleration_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_LINEAR_ACCELERATION_PERIOD, [], '', 'L');
}

=item set_gravity_vector_period()

Sets the period in ms with which the :func:`GravityVector` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_gravity_vector_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_GRAVITY_VECTOR_PERIOD, [$period], 'L', '');
}

=item get_gravity_vector_period()

Returns the period as set by :func:`SetGravityVectorPeriod`.

=cut

sub get_gravity_vector_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_GRAVITY_VECTOR_PERIOD, [], '', 'L');
}

=item set_quaternion_period()

Sets the period in ms with which the :func:`Quaternion` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_quaternion_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_QUATERNION_PERIOD, [$period], 'L', '');
}

=item get_quaternion_period()

Returns the period as set by :func:`SetQuaternionPeriod`.

=cut

sub get_quaternion_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_QUATERNION_PERIOD, [], '', 'L');
}

=item set_all_data_period()

Sets the period in ms with which the :func:`AllData` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_all_data_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ALL_DATA_PERIOD, [$period], 'L', '');
}

=item get_all_data_period()

Returns the period as set by :func:`SetAllDataPeriod`.

=cut

sub get_all_data_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALL_DATA_PERIOD, [], '', 'L');
}

=item enable_status_led()

Enables the status LED.

The status LED is the blue LED next to the USB connector. If enabled is is
on and it flickers if data is transfered. If disabled it is always off.

The default state is enabled.

=cut

sub enable_status_led
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_STATUS_LED, [], '', '');
}

=item disable_status_led()

Disables the status LED.

The status LED is the blue LED next to the USB connector. If enabled is is
on and it flickers if data is transfered. If disabled it is always off.

The default state is enabled.

=cut

sub disable_status_led
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_STATUS_LED, [], '', '');
}

=item is_status_led_enabled()

Returns *true* if the status LED is enabled, *false* otherwise.

=cut

sub is_status_led_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_STATUS_LED_ENABLED, [], '', 'C');
}

=item get_protocol1_bricklet_name()

Returns the firmware and protocol version and the name of the Bricklet for a
given port.

This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
plugins.

=cut

sub get_protocol1_bricklet_name
{
	my ($self, $port) = @_;

	return $self->_send_request(&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, [$port], 'a', 'C C3 Z40');
}

=item get_chip_temperature()

Returns the temperature in °C/10 as measured inside the microcontroller. The
value returned is not the ambient temperature!

The temperature is only proportional to the real temperature and it has an
accuracy of +-15%. Practically it is only useful as an indicator for
temperature changes.

=cut

sub get_chip_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIP_TEMPERATURE, [], '', 's');
}

=item reset()

Calling this function will reset the Brick. Calling this function
on a Brick inside of a stack will reset the whole stack.

After a reset you have to create new device objects,
calling functions on the existing ones will result in
undefined behavior!

=cut

sub reset
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_RESET, [], '', '');
}

=item get_identity()

Returns the UID, the UID where the Brick is connected to, 
the position, the hardware and firmware version as well as the
device identifier.

The position can be '0'-'8' (stack position).

The device identifier numbers can be found :ref:`here <device_identifier>`.
|device_identifier_constant|

=cut

sub get_identity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_IDENTITY, [], '', 'Z8 Z8 a C3 C3 S');
}
=back
=cut

1;
