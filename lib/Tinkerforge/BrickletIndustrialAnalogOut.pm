
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

Tinkerforge::BrickletIndustrialAnalogOut - Generates configurable DC voltage and current, 0V to 10V and 4mA to 20mA

=cut

package Tinkerforge::BrickletIndustrialAnalogOut;

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

This constant is used to identify a Industrial Analog Out Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 258;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Industrial Analog Out Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Industrial Analog Out Bricklet';


=item FUNCTION_ENABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE => 1;

=item FUNCTION_DISABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE => 2;

=item FUNCTION_IS_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ENABLED => 3;

=item FUNCTION_SET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE => 4;

=item FUNCTION_GET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE => 5;

=item FUNCTION_SET_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT => 6;

=item FUNCTION_GET_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT => 7;

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 8;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 9;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant VOLTAGE_RANGE_0_TO_5V => 0;
use constant VOLTAGE_RANGE_0_TO_10V => 1;
use constant CURRENT_RANGE_4_TO_20MA => 0;
use constant CURRENT_RANGE_0_TO_20MA => 1;
use constant CURRENT_RANGE_0_TO_24MA => 2;


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

	$self->{response_expected}->{&FUNCTION_ENABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;



	bless($self, $class);

	return $self;
}


=item enable()

Enables the output of voltage and current.

The default is disabled.

=cut

sub enable
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE, [], '', '');
}

=item disable()

Disables the output of voltage and current.

The default is disabled.

=cut

sub disable
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE, [], '', '');
}

=item is_enabled()

Returns *true* if output of voltage and current is enabled, *false* otherwise.

=cut

sub is_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_ENABLED, [], '', 'C');
}

=item set_voltage()

Sets the output voltage in mV.

The output voltage and output current are linked. Changing the output voltage
also changes the output current.

=cut

sub set_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE, [$voltage], 'S', '');
}

=item get_voltage()

Returns the voltage as set by :func:`SetVoltage`.

=cut

sub get_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE, [], '', 'S');
}

=item set_current()

Sets the output current in µA.

The output current and output voltage are linked. Changing the output current
also changes the output voltage.

=cut

sub set_current
{
	my ($self, $current) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT, [$current], 'S', '');
}

=item get_current()

Returns the current as set by :func:`SetCurrent`.

=cut

sub get_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT, [], '', 'S');
}

=item set_configuration()

Configures the voltage and current range.

Possible voltage ranges are:

* 0V to 5V
* 0V to 10V

Possible current ranges are:

* 4mA to 20mA
* 0mA to 20mA
* 0mA to 24mA

The resolution will always be 12 bit. This means, that the
precision is higher with a smaller range.

=cut

sub set_configuration
{
	my ($self, $voltage_range, $current_range) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$voltage_range, $current_range], 'C C', '');
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
