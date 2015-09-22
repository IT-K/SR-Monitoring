
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

Tinkerforge::BrickletLaserRangeFinder - Measures distance up to 40m with laser light

=cut

package Tinkerforge::BrickletLaserRangeFinder;

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

This constant is used to identify a Laser Range Finder Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 255;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Laser Range Finder Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Laser Range Finder Bricklet';

=item CALLBACK_DISTANCE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DISTANCE callback.

=cut

use constant CALLBACK_DISTANCE => 20;

=item CALLBACK_VELOCITY

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VELOCITY callback.

=cut

use constant CALLBACK_VELOCITY => 21;

=item CALLBACK_DISTANCE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DISTANCE_REACHED callback.

=cut

use constant CALLBACK_DISTANCE_REACHED => 22;

=item CALLBACK_VELOCITY_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VELOCITY_REACHED callback.

=cut

use constant CALLBACK_VELOCITY_REACHED => 23;

=item FUNCTION_GET_DISTANCE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE => 1;

=item FUNCTION_GET_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VELOCITY => 2;

=item FUNCTION_SET_DISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DISTANCE_CALLBACK_PERIOD => 3;

=item FUNCTION_GET_DISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE_CALLBACK_PERIOD => 4;

=item FUNCTION_SET_VELOCITY_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VELOCITY_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_VELOCITY_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VELOCITY_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD => 7;

=item FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD => 8;

=item FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD => 10;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 11;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 12;

=item FUNCTION_SET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOVING_AVERAGE => 13;

=item FUNCTION_GET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOVING_AVERAGE => 14;

=item FUNCTION_SET_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MODE => 15;

=item FUNCTION_GET_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MODE => 16;

=item FUNCTION_ENABLE_LASER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_LASER => 17;

=item FUNCTION_DISABLE_LASER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_LASER => 18;

=item FUNCTION_IS_LASER_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_LASER_ENABLED => 19;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant THRESHOLD_OPTION_OFF => 'x';
use constant THRESHOLD_OPTION_OUTSIDE => 'o';
use constant THRESHOLD_OPTION_INSIDE => 'i';
use constant THRESHOLD_OPTION_SMALLER => '<';
use constant THRESHOLD_OPTION_GREATER => '>';
use constant MODE_DISTANCE => 0;
use constant MODE_VELOCITY_MAX_13MS => 1;
use constant MODE_VELOCITY_MAX_32MS => 2;
use constant MODE_VELOCITY_MAX_64MS => 3;
use constant MODE_VELOCITY_MAX_127MS => 4;


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

	$self->{response_expected}->{&FUNCTION_GET_DISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VELOCITY_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VELOCITY_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE_LASER} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE_LASER} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_LASER_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_DISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_DISTANCE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VELOCITY_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_DISTANCE} = 'S';
	$self->{callback_formats}->{&CALLBACK_VELOCITY} = 's';
	$self->{callback_formats}->{&CALLBACK_DISTANCE_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_VELOCITY_REACHED} = 's';

	bless($self, $class);

	return $self;
}


=item get_distance()

Returns the measured distance. The value has a range of 0 to 4000
and is given in cm.

The Laser Range Finder Bricklet knows different modes. Distances
are only measured in the distance measurement mode,
see :func:`SetMode`. Also the laser has to be enabled, see
:func:`EnableLaser`.

If you want to get the distance periodically, it is recommended to
use the callback :func:`Distance` and set the period with 
:func:`SetDistanceCallbackPeriod`.

=cut

sub get_distance
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE, [], '', 'S');
}

=item get_velocity()

Returns the measured velocity. The value has a range of 0 to 12700
and is given in 1/100 m/s.

The Laser Range Finder Bricklet knows different modes. Velocity 
is only measured in the velocity measurement modes, 
see :func:`SetMode`. Also the laser has to be enabled, see
:func:`EnableLaser`.

If you want to get the velocity periodically, it is recommended to
use the callback :func:`Velocity` and set the period with 
:func:`SetVelocityCallbackPeriod`.

=cut

sub get_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VELOCITY, [], '', 's');
}

=item set_distance_callback_period()

Sets the period in ms with which the :func:`Distance` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Distance` is only triggered if the distance value has changed since the
last triggering.

The default value is 0.

=cut

sub set_distance_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_distance_callback_period()

Returns the period as set by :func:`SetDistanceCallbackPeriod`.

=cut

sub get_distance_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_velocity_callback_period()

Sets the period in ms with which the :func:`Velocity` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Velocity` is only triggered if the velocity value has changed since the
last triggering.

The default value is 0.

=cut

sub set_velocity_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_VELOCITY_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_velocity_callback_period()

Returns the period as set by :func:`SetVelocityCallbackPeriod`.

=cut

sub get_velocity_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VELOCITY_CALLBACK_PERIOD, [], '', 'L');
}

=item set_distance_callback_threshold()

Sets the thresholds for the :func:`DistanceReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
 "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
 "'<'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_distance_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_distance_callback_threshold()

Returns the threshold as set by :func:`SetDistanceCallbackThreshold`.

=cut

sub get_distance_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_velocity_callback_threshold()

Sets the thresholds for the :func:`VelocityReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the velocity is *outside* the min and max values"
 "'i'",    "Callback is triggered when the velocity is *inside* the min and max values"
 "'<'",    "Callback is triggered when the velocity is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the velocity is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_velocity_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_velocity_callback_threshold()

Returns the threshold as set by :func:`SetVelocityCallbackThreshold`.

=cut

sub get_velocity_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`DistanceReached`,
* :func:`VelocityReached`,

are triggered, if the thresholds

* :func:`SetDistanceCallbackThreshold`,
* :func:`SetVelocityCallbackThreshold`,

keep being reached.

The default value is 100.

=cut

sub set_debounce_period
{
	my ($self, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_DEBOUNCE_PERIOD, [$debounce], 'L', '');
}

=item get_debounce_period()

Returns the debounce period as set by :func:`SetDebouncePeriod`.

=cut

sub get_debounce_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DEBOUNCE_PERIOD, [], '', 'L');
}

=item set_moving_average()

Sets the length of a `moving averaging <https://en.wikipedia.org/wiki/Moving_average>`__
for the distance and velocity.

Setting the length to 0 will turn the averaging completely off. With less
averaging, there is more noise on the data.

The range for the averaging is 0-30.

The default value is 10.

=cut

sub set_moving_average
{
	my ($self, $distance_average_length, $velocity_average_length) = @_;

	$self->_send_request(&FUNCTION_SET_MOVING_AVERAGE, [$distance_average_length, $velocity_average_length], 'C C', '');
}

=item get_moving_average()

Returns the length moving average as set by :func:`SetMovingAverage`.

=cut

sub get_moving_average
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOVING_AVERAGE, [], '', 'C C');
}

=item set_mode()

The LIDAR has five different modes. One mode is for distance
measurements and four modes are for velocity measurements with
different ranges.

The following modes are available:

* 0: Distance is measured with resolution 1.0 cm and range 0-400 cm
* 1: Velocity is measured with resolution 0.1 m/s and range is 0-12.7 m/s
* 2: Velocity is measured with resolution 0.25 m/s and range is 0-31.75 m/s
* 3: Velocity is measured with resolution 0.5 m/s and range is 0-63.5 m/s
* 4: Velocity is measured with resolution 1.0 m/s and range is 0-127 m/s

The default mode is 0 (distance is measured).

=cut

sub set_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_MODE, [$mode], 'C', '');
}

=item get_mode()

Returns the mode as set by :func:`SetMode`.

=cut

sub get_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MODE, [], '', 'C');
}

=item enable_laser()

Activates the laser of the LIDAR.

We recommend that you wait 250ms after enabling the laser before
the first call of :func:`GetDistance` to ensure stable measurements.

=cut

sub enable_laser
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_LASER, [], '', '');
}

=item disable_laser()

Deactivates the laser of the LIDAR.

=cut

sub disable_laser
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_LASER, [], '', '');
}

=item is_laser_enabled()

Returns *true* if the laser is enabled, *false* otherwise.

=cut

sub is_laser_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_LASER_ENABLED, [], '', 'C');
}

=item get_identity()

Returns the UID, the UID where the Bricklet is connected to, 
the position, the hardware and firmware version as well as the
device identifier.

The position can be 'a', 'b', 'c' or 'd'.

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
