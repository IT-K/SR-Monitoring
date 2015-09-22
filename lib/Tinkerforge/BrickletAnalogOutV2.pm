
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

Tinkerforge::BrickletAnalogOutV2 - Generates configurable DC voltage between 0V and 12V

=cut

package Tinkerforge::BrickletAnalogOutV2;

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

This constant is used to identify a Analog Out Bricklet 2.0.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 256;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Analog Out Bricklet 2.0.

=cut

use constant DEVICE_DISPLAY_NAME => 'Analog Out Bricklet 2.0';


=item FUNCTION_SET_OUTPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_OUTPUT_VOLTAGE => 1;

=item FUNCTION_GET_OUTPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OUTPUT_VOLTAGE => 2;

=item FUNCTION_GET_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_INPUT_VOLTAGE => 3;

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

	$self->{response_expected}->{&FUNCTION_SET_OUTPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_OUTPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;



	bless($self, $class);

	return $self;
}


=item set_output_voltage()

Sets the voltage in mV. The possible range is 0V to 12V (0-12000).

=cut

sub set_output_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_OUTPUT_VOLTAGE, [$voltage], 'S', '');
}

=item get_output_voltage()

Returns the voltage as set by :func:`SetOutputVoltage`.

=cut

sub get_output_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OUTPUT_VOLTAGE, [], '', 'S');
}

=item get_input_voltage()

Returns the input voltage in mV.

=cut

sub get_input_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_INPUT_VOLTAGE, [], '', 'S');
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
