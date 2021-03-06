
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

Tinkerforge::BrickletJoystick - 2-axis joystick with push-button

=cut

package Tinkerforge::BrickletJoystick;

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

This constant is used to identify a Joystick Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 210;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Joystick Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Joystick Bricklet';

=item CALLBACK_POSITION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POSITION callback.

=cut

use constant CALLBACK_POSITION => 15;

=item CALLBACK_ANALOG_VALUE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE callback.

=cut

use constant CALLBACK_ANALOG_VALUE => 16;

=item CALLBACK_POSITION_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POSITION_REACHED callback.

=cut

use constant CALLBACK_POSITION_REACHED => 17;

=item CALLBACK_ANALOG_VALUE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE_REACHED callback.

=cut

use constant CALLBACK_ANALOG_VALUE_REACHED => 18;

=item CALLBACK_PRESSED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_PRESSED callback.

=cut

use constant CALLBACK_PRESSED => 19;

=item CALLBACK_RELEASED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_RELEASED callback.

=cut

use constant CALLBACK_RELEASED => 20;

=item FUNCTION_GET_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POSITION => 1;

=item FUNCTION_IS_PRESSED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_PRESSED => 2;

=item FUNCTION_GET_ANALOG_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE => 3;

=item FUNCTION_CALIBRATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CALIBRATE => 4;

=item FUNCTION_SET_POSITION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_POSITION_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_POSITION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POSITION_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD => 7;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD => 8;

=item FUNCTION_SET_POSITION_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_POSITION_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_POSITION_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POSITION_CALLBACK_THRESHOLD => 10;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD => 11;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD => 12;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 13;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 14;

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

	$self->{response_expected}->{&FUNCTION_GET_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_PRESSED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CALIBRATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_POSITION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_POSITION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_POSITION_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_POSITION_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_POSITION_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_PRESSED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_RELEASED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_POSITION} = 's s';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE} = 'S S';
	$self->{callback_formats}->{&CALLBACK_POSITION_REACHED} = 's s';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE_REACHED} = 'S S';
	$self->{callback_formats}->{&CALLBACK_PRESSED} = '';
	$self->{callback_formats}->{&CALLBACK_RELEASED} = '';

	bless($self, $class);

	return $self;
}


=item get_position()

Returns the position of the Joystick. The value ranges between -100 and
100 for both axis. The middle position of the joystick is x=0, y=0. The
returned values are averaged and calibrated (see :func:`Calibrate`).

If you want to get the position periodically, it is recommended to use the
callback :func:`Position` and set the period with 
:func:`SetPositionCallbackPeriod`.

=cut

sub get_position
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POSITION, [], '', 's s');
}

=item is_pressed()

Returns *true* if the button is pressed and *false* otherwise.

It is recommended to use the :func:`Pressed` and :func:`Released` callbacks
to handle the button.

=cut

sub is_pressed
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_PRESSED, [], '', 'C');
}

=item get_analog_value()

Returns the values as read by a 12-bit analog-to-digital converter.
The values are between 0 and 4095 for both axis.

.. note::
 The values returned by :func:`GetPosition` are averaged over several samples
 to yield less noise, while :func:`GetAnalogValue` gives back raw
 unfiltered analog values. The only reason to use :func:`GetAnalogValue` is,
 if you need the full resolution of the analog-to-digital converter.

If you want the analog values periodically, it is recommended to use the 
callback :func:`AnalogValue` and set the period with 
:func:`SetAnalogValueCallbackPeriod`.

=cut

sub get_analog_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE, [], '', 'S S');
}

=item calibrate()

Calibrates the middle position of the Joystick. If your Joystick Bricklet
does not return x=0 and y=0 in the middle position, call this function
while the Joystick is standing still in the middle position.

The resulting calibration will be saved on the EEPROM of the Joystick
Bricklet, thus you only have to calibrate it once.

=cut

sub calibrate
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_CALIBRATE, [], '', '');
}

=item set_position_callback_period()

Sets the period in ms with which the :func:`Position` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Position` is only triggered if the position has changed since the
last triggering.

The default value is 0.

=cut

sub set_position_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_POSITION_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_position_callback_period()

Returns the period as set by :func:`SetPositionCallbackPeriod`.

=cut

sub get_position_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POSITION_CALLBACK_PERIOD, [], '', 'L');
}

=item set_analog_value_callback_period()

Sets the period in ms with which the :func:`AnalogValue` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`AnalogValue` is only triggered if the analog values have changed since the
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

=item set_position_callback_threshold()

Sets the thresholds for the :func:`PositionReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the position is *outside* the min and max values"
 "'i'",    "Callback is triggered when the position is *inside* the min and max values"
 "'<'",    "Callback is triggered when the position is smaller than the min values (max is ignored)"
 "'>'",    "Callback is triggered when the position is greater than the min values (max is ignored)"

The default value is ('x', 0, 0, 0, 0).

=cut

sub set_position_callback_threshold
{
	my ($self, $option, $min_x, $max_x, $min_y, $max_y) = @_;

	$self->_send_request(&FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, [$option, $min_x, $max_x, $min_y, $max_y], 'a s s s s', '');
}

=item get_position_callback_threshold()

Returns the threshold as set by :func:`SetPositionCallbackThreshold`.

=cut

sub get_position_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, [], '', 'a s s s s');
}

=item set_analog_value_callback_threshold()

Sets the thresholds for the :func:`AnalogValueReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the analog values are *outside* the min and max values"
 "'i'",    "Callback is triggered when the analog values are *inside* the min and max values"
 "'<'",    "Callback is triggered when the analog values are smaller than the min values (max is ignored)"
 "'>'",    "Callback is triggered when the analog values are greater than the min values (max is ignored)"

The default value is ('x', 0, 0, 0, 0).

=cut

sub set_analog_value_callback_threshold
{
	my ($self, $option, $min_x, $max_x, $min_y, $max_y) = @_;

	$self->_send_request(&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, [$option, $min_x, $max_x, $min_y, $max_y], 'a S S S S', '');
}

=item get_analog_value_callback_threshold()

Returns the threshold as set by :func:`SetAnalogValueCallbackThreshold`.

=cut

sub get_analog_value_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, [], '', 'a S S S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`PositionReached`,
* :func:`AnalogValueReached`

are triggered, if the thresholds

* :func:`SetPositionCallbackThreshold`,
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
