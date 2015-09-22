
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

Tinkerforge::BrickletLoadCell - Measures weight with a load cell

=cut

package Tinkerforge::BrickletLoadCell;

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

This constant is used to identify a Load Cell Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 253;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Load Cell Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Load Cell Bricklet';

=item CALLBACK_WEIGHT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_WEIGHT callback.

=cut

use constant CALLBACK_WEIGHT => 17;

=item CALLBACK_WEIGHT_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_WEIGHT_REACHED callback.

=cut

use constant CALLBACK_WEIGHT_REACHED => 18;

=item FUNCTION_GET_WEIGHT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WEIGHT => 1;

=item FUNCTION_SET_WEIGHT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WEIGHT_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_WEIGHT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WEIGHT_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD => 5;

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

=item FUNCTION_SET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOVING_AVERAGE => 8;

=item FUNCTION_GET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOVING_AVERAGE => 9;

=item FUNCTION_LED_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LED_ON => 10;

=item FUNCTION_LED_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LED_OFF => 11;

=item FUNCTION_IS_LED_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_LED_ON => 12;

=item FUNCTION_CALIBRATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CALIBRATE => 13;

=item FUNCTION_TARE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_TARE => 14;

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 15;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 16;

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
use constant RATE_10HZ => 0;
use constant RATE_80HZ => 1;
use constant GAIN_128X => 0;
use constant GAIN_64X => 1;
use constant GAIN_32X => 2;


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

	$self->{response_expected}->{&FUNCTION_GET_WEIGHT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WEIGHT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_WEIGHT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_LED_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_LED_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_LED_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CALIBRATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_TARE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_WEIGHT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_WEIGHT_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_WEIGHT} = 'l';
	$self->{callback_formats}->{&CALLBACK_WEIGHT_REACHED} = 'l';

	bless($self, $class);

	return $self;
}


=item get_weight()

Returns the currently measured weight in grams.

If you want to get the weight periodically, it is recommended 
to use the callback :func:`Weight` and set the period with 
:func:`SetWeightCallbackPeriod`.

=cut

sub get_weight
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WEIGHT, [], '', 'l');
}

=item set_weight_callback_period()

Sets the period in ms with which the :func:`Weight` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Weight` is only triggered if the weight has changed since the
last triggering.

The default value is 0.

=cut

sub set_weight_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_WEIGHT_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_weight_callback_period()

Returns the period as set by :func:`SetWeightCallbackPeriod`.

=cut

sub get_weight_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WEIGHT_CALLBACK_PERIOD, [], '', 'L');
}

=item set_weight_callback_threshold()

Sets the thresholds for the :func:`WeightReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the weight is *outside* the min and max values"
 "'i'",    "Callback is triggered when the weight is *inside* the min and max values"
 "'<'",    "Callback is triggered when the weight is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the weight is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_weight_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_weight_callback_threshold()

Returns the threshold as set by :func:`SetWeightCallbackThreshold`.

=cut

sub get_weight_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`WeightReached`

is triggered, if the threshold

* :func:`SetWeightCallbackThreshold`

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

=item set_moving_average()

Sets the length of a `moving averaging <https://en.wikipedia.org/wiki/Moving_average>`__
for the weight value.

Setting the length to 1 will turn the averaging off. With less
averaging, there is more noise on the data.

The range for the averaging is 1-40.

The default value is 4.

=cut

sub set_moving_average
{
	my ($self, $average) = @_;

	$self->_send_request(&FUNCTION_SET_MOVING_AVERAGE, [$average], 'C', '');
}

=item get_moving_average()

Returns the length moving average as set by :func:`SetMovingAverage`.

=cut

sub get_moving_average
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOVING_AVERAGE, [], '', 'C');
}

=item led_on()

Turns the LED on.

=cut

sub led_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LED_ON, [], '', '');
}

=item led_off()

Turns the LED off.

=cut

sub led_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LED_OFF, [], '', '');
}

=item is_led_on()

Returns *true* if the led is on, *false* otherwise.

=cut

sub is_led_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_LED_ON, [], '', 'C');
}

=item calibrate()

To calibrate your Load Cell Bricklet you have to

* empty the scale and call this function with 0 and
* add a known weight to the scale and call this function with the weight in 
  grams.

The calibration is saved in the EEPROM of the Bricklet and only
needs to be done once.

We recommend to use the Brick Viewer for calibration, you don't need
to call this function in your source code.

=cut

sub calibrate
{
	my ($self, $weight) = @_;

	$self->_send_request(&FUNCTION_CALIBRATE, [$weight], 'L', '');
}

=item tare()

Sets the currently measured weight as tare weight.

=cut

sub tare
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_TARE, [], '', '');
}

=item set_configuration()

The measurement rate and gain are configurable.

The rate can be either 10Hz or 80Hz. A faster rate will produce more noise.
It is additionally possible to add a moving average
(see :func:`SetMovingAverage`) to the measurements.

The gain can be 128x, 64x or 32x. It represents a measurement range of
±20mV, ±40mV and ±80mV respectively. The Load Cell Bricklet uses an
excitation voltage of 5V and most load cells use an output of 2mV/V. That
means the voltage range is ±15mV for most load cells (i.e. gain of 128x
is best). If you don't know what all of this means you should keep it at 
128x, it will most likely be correct.

The configuration is saved in the EEPROM of the Bricklet and only
needs to be done once.

We recommend to use the Brick Viewer for configuration, you don't need
to call this function in your source code.

The default rate is 10Hz and the default gain is 128x.

=cut

sub set_configuration
{
	my ($self, $rate, $gain) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$rate, $gain], 'C C', '');
}

=item get_configuration()

Returns the configuration as set by :func:`SetConfiguration`.

=cut

sub get_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIGURATION, [], '', 'C C');
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
