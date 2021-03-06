
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

Tinkerforge::BrickletAmbientLight - Measures ambient light up to 900lux

=cut

package Tinkerforge::BrickletAmbientLight;

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

This constant is used to identify a Ambient Light Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 21;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Ambient Light Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Ambient Light Bricklet';

=item CALLBACK_ILLUMINANCE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ILLUMINANCE callback.

=cut

use constant CALLBACK_ILLUMINANCE => 13;

=item CALLBACK_ANALOG_VALUE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE callback.

=cut

use constant CALLBACK_ANALOG_VALUE => 14;

=item CALLBACK_ILLUMINANCE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ILLUMINANCE_REACHED callback.

=cut

use constant CALLBACK_ILLUMINANCE_REACHED => 15;

=item CALLBACK_ANALOG_VALUE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE_REACHED callback.

=cut

use constant CALLBACK_ANALOG_VALUE_REACHED => 16;

=item FUNCTION_GET_ILLUMINANCE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ILLUMINANCE => 1;

=item FUNCTION_GET_ANALOG_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE => 2;

=item FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD => 3;

=item FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD => 4;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD => 7;

=item FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD => 8;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD => 10;

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

	$self->{response_expected}->{&FUNCTION_GET_ILLUMINANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ILLUMINANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ILLUMINANCE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_ILLUMINANCE} = 'S';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE} = 'S';
	$self->{callback_formats}->{&CALLBACK_ILLUMINANCE_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE_REACHED} = 'S';

	bless($self, $class);

	return $self;
}


=item get_illuminance()

Returns the illuminance of the ambient light sensor. The value
has a range of 0 to 9000 and is given in Lux/10, i.e. a value
of 4500 means that an illuminance of 450 Lux is measured.

If you want to get the illuminance periodically, it is recommended to use the
callback :func:`Illuminance` and set the period with 
:func:`SetIlluminanceCallbackPeriod`.

=cut

sub get_illuminance
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ILLUMINANCE, [], '', 'S');
}

=item get_analog_value()

Returns the value as read by a 12-bit analog-to-digital converter.
The value is between 0 and 4095.

.. note::
 The value returned by :func:`GetIlluminance` is averaged over several samples
 to yield less noise, while :func:`GetAnalogValue` gives back raw
 unfiltered analog values. The only reason to use :func:`GetAnalogValue` is,
 if you need the full resolution of the analog-to-digital converter.

 Also, the analog-to-digital converter covers three different ranges that are
 set dynamically depending on the light intensity. It is impossible to
 distinguish between these ranges with the analog value.

If you want the analog value periodically, it is recommended to use the 
callback :func:`AnalogValue` and set the period with 
:func:`SetAnalogValueCallbackPeriod`.

=cut

sub get_analog_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE, [], '', 'S');
}

=item set_illuminance_callback_period()

Sets the period in ms with which the :func:`Illuminance` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Illuminance` is only triggered if the illuminance has changed since the
last triggering.

The default value is 0.

=cut

sub set_illuminance_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_illuminance_callback_period()

Returns the period as set by :func:`SetIlluminanceCallbackPeriod`.

=cut

sub get_illuminance_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_analog_value_callback_period()

Sets the period in ms with which the :func:`AnalogValue` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`AnalogValue` is only triggered if the analog value has changed since the
last triggering.

The default value is 0.

=cut

sub set_analog_value_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_analog_value_callback_period()

Returns the period as set by :func:`SetAnalogValueCallbackPeriod`.

=cut

sub get_analog_value_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_illuminance_callback_threshold()

Sets the thresholds for the :func:`IlluminanceReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the illuminance is *outside* the min and max values"
 "'i'",    "Callback is triggered when the illuminance is *inside* the min and max values"
 "'<'",    "Callback is triggered when the illuminance is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the illuminance is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_illuminance_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_illuminance_callback_threshold()

Returns the threshold as set by :func:`SetIlluminanceCallbackThreshold`.

=cut

sub get_illuminance_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_analog_value_callback_threshold()

Sets the thresholds for the :func:`AnalogValueReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
 "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
 "'<'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_analog_value_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_analog_value_callback_threshold()

Returns the threshold as set by :func:`SetAnalogValueCallbackThreshold`.

=cut

sub get_analog_value_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`IlluminanceReached`,
* :func:`AnalogValueReached`

are triggered, if the thresholds

* :func:`SetIlluminanceCallbackThreshold`,
* :func:`SetAnalogValueCallbackThreshold`

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
