
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

Tinkerforge::BrickletRS232 - Communicates with RS232 devices

=cut

package Tinkerforge::BrickletRS232;

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

This constant is used to identify a RS232 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 254;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a RS232 Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'RS232 Bricklet';

=item CALLBACK_READ_CALLBACK

This constant is used with the register_callback() subroutine to specify
the CALLBACK_READ_CALLBACK callback.

=cut

use constant CALLBACK_READ_CALLBACK => 8;

=item FUNCTION_WRITE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE => 1;

=item FUNCTION_READ

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_READ => 2;

=item FUNCTION_ENABLE_READ_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_READ_CALLBACK => 3;

=item FUNCTION_DISABLE_READ_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_READ_CALLBACK => 4;

=item FUNCTION_IS_READ_CALLBACK_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_READ_CALLBACK_ENABLED => 5;

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 6;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 7;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant BAUDRATE_300 => 0;
use constant BAUDRATE_600 => 1;
use constant BAUDRATE_1200 => 2;
use constant BAUDRATE_2400 => 3;
use constant BAUDRATE_4800 => 4;
use constant BAUDRATE_9600 => 5;
use constant BAUDRATE_14400 => 6;
use constant BAUDRATE_28800 => 7;
use constant BAUDRATE_38400 => 8;
use constant BAUDRATE_57600 => 9;
use constant BAUDRATE_115200 => 10;
use constant BAUDRATE_230400 => 11;
use constant PARITY_NONE => 0;
use constant PARITY_ODD => 1;
use constant PARITY_EVEN => 2;
use constant PARITY_FORCED_PARITY_1 => 3;
use constant PARITY_FORCED_PARITY_0 => 4;
use constant STOPBITS_1 => 1;
use constant STOPBITS_2 => 2;
use constant WORDLENGTH_5 => 5;
use constant WORDLENGTH_6 => 6;
use constant WORDLENGTH_7 => 7;
use constant WORDLENGTH_8 => 8;
use constant HARDWARE_FLOWCONTROL_OFF => 0;
use constant HARDWARE_FLOWCONTROL_ON => 1;
use constant SOFTWARE_FLOWCONTROL_OFF => 0;
use constant SOFTWARE_FLOWCONTROL_ON => 1;


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

	$self->{response_expected}->{&FUNCTION_WRITE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_READ} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE_READ_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_DISABLE_READ_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_READ_CALLBACK_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_READ_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_READ_CALLBACK} = 'a60 C';

	bless($self, $class);

	return $self;
}


=item write()

Writes a string of up to 60 characters to the RS232 interface. The string
can be binary data, ASCII or similar is not necessary.

The length of the string has to be given as an additional parameter.

The return value is the number of bytes that could be written.

See :func:`SetConfigurations` for configuration possibilities
regarding baudrate, parity and so on.

=cut

sub write
{
	my ($self, $message, $length) = @_;

	return $self->_send_request(&FUNCTION_WRITE, [$message, $length], 'a60 C', 'C');
}

=item read()

Returns the currently buffered message. The maximum length
of message is 60. If the length is given as 0, there was no
new data available.

Instead of polling with this function, you can also use
callbacks. See :func:`EnableReadCallback` and :func:`ReadCallback`.

=cut

sub read
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_READ, [], '', 'a60 C');
}

=item enable_read_callback()

Enables the :func:`ReadCallback`.

By default the callback is disabled.

=cut

sub enable_read_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_READ_CALLBACK, [], '', '');
}

=item disable_read_callback()

Disables the :func:`ReadCallback`.

By default the callback is disabled.

=cut

sub disable_read_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_READ_CALLBACK, [], '', '');
}

=item is_read_callback_enabled()

Returns *true* if the :func:`ReadCallback` is enabled,
*false* otherwise.

=cut

sub is_read_callback_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_READ_CALLBACK_ENABLED, [], '', 'C');
}

=item set_configuration()

Sets the configuration for the RS232 communication. Available options:

* Baudrate between 300 and 230400 baud.
* Parity of none, odd, even or forced parity.
* Stopbits can be 1 or 2.
* Word length of 5 to 8.
* Hard-/Software flow control can each be on or off.

The default is: 115200 baud, parity none, 1 stop bit, word length 8, hard-/software flow control off.

=cut

sub set_configuration
{
	my ($self, $baudrate, $parity, $stopbits, $wordlength, $hardware_flowcontrol, $software_flowcontrol) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$baudrate, $parity, $stopbits, $wordlength, $hardware_flowcontrol, $software_flowcontrol], 'C C C C C C', '');
}

=item get_configuration()

Returns the configuration as set by :func:`SetConfiguration`.

=cut

sub get_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIGURATION, [], '', 'C C C C C C');
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
