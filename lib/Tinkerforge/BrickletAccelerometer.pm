
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

Tinkerforge::BrickletAccelerometer - Measures acceleration in three axis

=cut

package Tinkerforge::BrickletAccelerometer;

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

This constant is used to identify a Accelerometer Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 250;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Accelerometer Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Accelerometer Bricklet';

=item CALLBACK_ACCELERATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ACCELERATION callback.

=cut

use constant CALLBACK_ACCELERATION => 14;

=item CALLBACK_ACCELERATION_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ACCELERATION_REACHED callback.

=cut

use constant CALLBACK_ACCELERATION_REACHED => 15;

=item FUNCTION_GET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION => 1;

=item FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD => 5;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 6;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 7;

=item FUNCTION_GET_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE => 8;

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 9;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 10;

=item FUNCTION_LED_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LED_ON => 11;

=item FUNCTION_LED_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LED_OFF => 12;

=item FUNCTION_IS_LED_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_LED_ON => 13;

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
use constant DATA_RATE_OFF => 0;
use constant DATA_RATE_3HZ => 1;
use constant DATA_RATE_6HZ => 2;
use constant DATA_RATE_12HZ => 3;
use constant DATA_RATE_25HZ => 4;
use constant DATA_RATE_50HZ => 5;
use constant DATA_RATE_100HZ => 6;
use constant DATA_RATE_400HZ => 7;
use constant DATA_RATE_800HZ => 8;
use constant DATA_RATE_1600HZ => 9;
use constant FULL_SCALE_2G => 0;
use constant FULL_SCALE_4G => 1;
use constant FULL_SCALE_6G => 2;
use constant FULL_SCALE_8G => 3;
use constant FULL_SCALE_16G => 4;
use constant FILTER_BANDWIDTH_800HZ => 0;
use constant FILTER_BANDWIDTH_400HZ => 1;
use constant FILTER_BANDWIDTH_200HZ => 2;
use constant FILTER_BANDWIDTH_50HZ => 3;


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
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_LED_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_LED_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_LED_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ACCELERATION_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_ACCELERATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_ACCELERATION_REACHED} = 's s s';

	bless($self, $class);

	return $self;
}


=item get_acceleration()

Returns the acceleration in x, y and z direction. The values
are given in mg (1/1000 g), not to be confused with grams.

If you want to get the acceleration periodically, it is recommended 
to use the callback :func:`Acceleration` and set the period with 
:func:`SetAccelerationCallbackPeriod`.

=cut

sub get_acceleration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION, [], '', 's s s');
}

=item set_acceleration_callback_period()

Sets the period in ms with which the :func:`Acceleration` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Acceleration` is only triggered if the acceleration has changed since the
last triggering.

The default value is 0.

=cut

sub set_acceleration_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_acceleration_callback_period()

Returns the period as set by :func:`SetAccelerationCallbackPeriod`.

=cut

sub get_acceleration_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD, [], '', 'L');
}

=item set_acceleration_callback_threshold()

Sets the thresholds for the :func:`AccelerationReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0, 0, 0, 0, 0).

=cut

sub set_acceleration_callback_threshold
{
	my ($self, $option, $min_x, $max_x, $min_y, $max_y, $min_z, $max_z) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD, [$option, $min_x, $max_x, $min_y, $max_y, $min_z, $max_z], 'a s s s s s s', '');
}

=item get_acceleration_callback_threshold()

Returns the threshold as set by :func:`SetAccelerationCallbackThreshold`.

=cut

sub get_acceleration_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD, [], '', 'a s s s s s s');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`AccelerationReached`

is triggered, if the threshold

* :func:`SetAccelerationCallbackThreshold`

keeps being reached.

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

=item get_temperature()

Returns the temperature of the accelerometer in °C.

=cut

sub get_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE, [], '', 's');
}

=item set_configuration()

Configures the data rate, full scale range and filter bandwidth.
Possible values are:

* Data rate of 0Hz to 1600Hz.
* Full scale range of -2G to +2G up to -16G to +16G.
* Filter bandwidth between 50Hz and 800Hz.

Decreasing data rate or full scale range will also decrease the noise on 
the data.

The default values are 100Hz data rate, -4G to +4G range and 200Hz
filter bandwidth.

=cut

sub set_configuration
{
	my ($self, $data_rate, $full_scale, $filter_bandwidth) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$data_rate, $full_scale, $filter_bandwidth], 'C C C', '');
}

=item get_configuration()

Returns the configuration as set by :func:`SetConfiguration`.

=cut

sub get_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIGURATION, [], '', 'C C C');
}

=item led_on()

Enables the LED on the Bricklet.

=cut

sub led_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LED_ON, [], '', '');
}

=item led_off()

Disables the LED on the Bricklet.

=cut

sub led_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LED_OFF, [], '', '');
}

=item is_led_on()

Returns *true* if the LED is enabled, *false* otherwise.

=cut

sub is_led_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_LED_ON, [], '', 'C');
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
