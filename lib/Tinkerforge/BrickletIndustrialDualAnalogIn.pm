
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

Tinkerforge::BrickletIndustrialDualAnalogIn - Measures two DC voltages between -35V and +35V with 24bit resolution each

=cut

package Tinkerforge::BrickletIndustrialDualAnalogIn;

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

This constant is used to identify a Industrial Dual Analog In Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 249;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Industrial Dual Analog In Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Industrial Dual Analog In Bricklet';

=item CALLBACK_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VOLTAGE callback.

=cut

use constant CALLBACK_VOLTAGE => 13;

=item CALLBACK_VOLTAGE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VOLTAGE_REACHED callback.

=cut

use constant CALLBACK_VOLTAGE_REACHED => 14;

=item FUNCTION_GET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE => 1;

=item FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD => 5;

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

=item FUNCTION_SET_SAMPLE_RATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SAMPLE_RATE => 8;

=item FUNCTION_GET_SAMPLE_RATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SAMPLE_RATE => 9;

=item FUNCTION_SET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CALIBRATION => 10;

=item FUNCTION_GET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CALIBRATION => 11;

=item FUNCTION_GET_ADC_VALUES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ADC_VALUES => 12;

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
use constant SAMPLE_RATE_976_SPS => 0;
use constant SAMPLE_RATE_488_SPS => 1;
use constant SAMPLE_RATE_244_SPS => 2;
use constant SAMPLE_RATE_122_SPS => 3;
use constant SAMPLE_RATE_61_SPS => 4;
use constant SAMPLE_RATE_4_SPS => 5;
use constant SAMPLE_RATE_2_SPS => 6;
use constant SAMPLE_RATE_1_SPS => 7;


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

	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_SAMPLE_RATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SAMPLE_RATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ADC_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VOLTAGE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_VOLTAGE} = 'C l';
	$self->{callback_formats}->{&CALLBACK_VOLTAGE_REACHED} = 'C l';

	bless($self, $class);

	return $self;
}


=item get_voltage()

Returns the voltage for the given channel in mV.

If you want to get the voltage periodically, it is recommended to use the
callback :func:`Voltage` and set the period with 
:func:`SetVoltageCallbackPeriod`.

=cut

sub get_voltage
{
	my ($self, $channel) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE, [$channel], 'C', 'l');
}

=item set_voltage_callback_period()

Sets the period in ms with which the :func:`Voltage` callback is triggered
periodically for the given channel. A value of 0 turns the callback off.

:func:`Voltage` is only triggered if the voltage has changed since the
last triggering.

The default value is 0.

=cut

sub set_voltage_callback_period
{
	my ($self, $channel, $period) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, [$channel, $period], 'C L', '');
}

=item get_voltage_callback_period()

Returns the period as set by :func:`SetVoltageCallbackPeriod`.

=cut

sub get_voltage_callback_period
{
	my ($self, $channel) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, [$channel], 'C', 'L');
}

=item set_voltage_callback_threshold()

Sets the thresholds for the :func:`VoltageReached` callback for the given
channel.

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
 "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
 "'<'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_voltage_callback_threshold
{
	my ($self, $channel, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, [$channel, $option, $min, $max], 'C a l l', '');
}

=item get_voltage_callback_threshold()

Returns the threshold as set by :func:`SetVoltageCallbackThreshold`.

=cut

sub get_voltage_callback_threshold
{
	my ($self, $channel) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, [$channel], 'C', 'a l l');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`VoltageReached`

is triggered, if the threshold

* :func:`SetVoltageCallbackThreshold`

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

=item set_sample_rate()

Sets the sample rate. The sample rate can be between 1 sample per second
and 976 samples per second. Decreasing the sample rate will also decrease the
noise on the data.

=cut

sub set_sample_rate
{
	my ($self, $rate) = @_;

	$self->_send_request(&FUNCTION_SET_SAMPLE_RATE, [$rate], 'C', '');
}

=item get_sample_rate()

Returns the sample rate as set by :func:`SetSampleRate`.

=cut

sub get_sample_rate
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SAMPLE_RATE, [], '', 'C');
}

=item set_calibration()

Sets offset and gain of MCP3911 internal calibration registers.

See MCP3911 datasheet 7.7 and 7.8. The Industrial Dual Analog In Bricklet
is already factory calibrated by Tinkerforge. It should not be necessary
for you to use this function

=cut

sub set_calibration
{
	my ($self, $offset, $gain) = @_;

	$self->_send_request(&FUNCTION_SET_CALIBRATION, [$offset, $gain], 'l2 l2', '');
}

=item get_calibration()

Returns the calibration as set by :func:`SetCalibration`.

=cut

sub get_calibration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CALIBRATION, [], '', 'l2 l2');
}

=item get_adc_values()

Returns the ADC values as given by the MCP3911 IC. This function
is needed for proper calibration, see :func:`SetCalibration`.

=cut

sub get_adc_values
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ADC_VALUES, [], '', 'l2');
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
