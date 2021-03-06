
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

Tinkerforge::BrickletMultiTouch - Capacitive touch sensor for 12 electrodes

=cut

package Tinkerforge::BrickletMultiTouch;

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

This constant is used to identify a Multi Touch Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 234;

=item DEVICE_DISPLAY_NAME

This constant represents the display name of a Multi Touch Bricklet.

=cut

use constant DEVICE_DISPLAY_NAME => 'Multi Touch Bricklet';

=item CALLBACK_TOUCH_STATE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TOUCH_STATE callback.

=cut

use constant CALLBACK_TOUCH_STATE => 5;

=item FUNCTION_GET_TOUCH_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TOUCH_STATE => 1;

=item FUNCTION_RECALIBRATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RECALIBRATE => 2;

=item FUNCTION_SET_ELECTRODE_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ELECTRODE_CONFIG => 3;

=item FUNCTION_GET_ELECTRODE_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ELECTRODE_CONFIG => 4;

=item FUNCTION_SET_ELECTRODE_SENSITIVITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ELECTRODE_SENSITIVITY => 6;

=item FUNCTION_GET_ELECTRODE_SENSITIVITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ELECTRODE_SENSITIVITY => 7;

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

	$self->{response_expected}->{&FUNCTION_GET_TOUCH_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RECALIBRATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_ELECTRODE_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ELECTRODE_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_TOUCH_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_ELECTRODE_SENSITIVITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ELECTRODE_SENSITIVITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_TOUCH_STATE} = 'S';

	bless($self, $class);

	return $self;
}


=item get_touch_state()

Returns the current touch state. The state is given as a bitfield.

Bits 0 to 11 represent the 12 electrodes and bit 12 represents
the proximity.

If an electrode is touched, the corresponding bit is true. If
a hand or similar is in proximity to the electrodes, bit 12 is
*true*.

Example: The state 4103 = 0x1007 = 0b1000000000111 means that
electrodes 0, 1 and 2 are touched and that something is in the
proximity of the electrodes.

The proximity is activated with a distance of 1-2cm. An electrode
is already counted as touched if a finger is nearly touching the
electrode. This means that you can put a piece of paper or foil
or similar on top of a electrode to build a touch panel with
a professional look.

=cut

sub get_touch_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TOUCH_STATE, [], '', 'S');
}

=item recalibrate()

Recalibrates the electrodes. Call this function whenever you changed
or moved you electrodes.

=cut

sub recalibrate
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_RECALIBRATE, [], '', '');
}

=item set_electrode_config()

Enables/disables electrodes with a bitfield (see :func:`GetTouchState`).

*True* enables the electrode, *false* disables the electrode. A
disabled electrode will always return *false* as its state. If you
don't need all electrodes you can disable the electrodes that are
not needed.

It is recommended that you disable the proximity bit (bit 12) if
the proximity feature is not needed. This will reduce the amount of
traffic that is produced by the :func:`TouchState` callback.

Disabling electrodes will also reduce power consumption.

Default: 8191 = 0x1FFF = 0b1111111111111 (all electrodes enabled)

=cut

sub set_electrode_config
{
	my ($self, $enabled_electrodes) = @_;

	$self->_send_request(&FUNCTION_SET_ELECTRODE_CONFIG, [$enabled_electrodes], 'S', '');
}

=item get_electrode_config()

Returns the electrode configuration, as set by :func:`SetElectrodeConfig`.

=cut

sub get_electrode_config
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ELECTRODE_CONFIG, [], '', 'S');
}

=item set_electrode_sensitivity()

Sets the sensitivity of the electrodes. An electrode with a high sensitivity
will register a touch earlier then an electrode with a low sensitivity.

If you build a big electrode you might need to decrease the sensitivity, since
the area that can be charged will get bigger. If you want to be able to
activate an electrode from further away you need to increase the sensitivity.

After a new sensitivity is set, you likely want to call :func:`Recalibrate`
to calibrate the electrodes with the newly defined sensitivity.

The valid sensitivity value range is 5-201.

The default sensitivity value is 181.

=cut

sub set_electrode_sensitivity
{
	my ($self, $sensitivity) = @_;

	$self->_send_request(&FUNCTION_SET_ELECTRODE_SENSITIVITY, [$sensitivity], 'C', '');
}

=item get_electrode_sensitivity()

Returns the current sensitivity, as set by :func:`SetElectrodeSensitivity`.

=cut

sub get_electrode_sensitivity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ELECTRODE_SENSITIVITY, [], '', 'C');
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
