package Ubic::Types;

# ABSTRACT: type constraints for Ubic

use strict;
use warnings;

use Types::Standard qw( Object Str StrMatch );
use Type::Library -base;

my $uo = __PACKAGE__->add_type(
	name    => 'UbicObject',
	parent  => Object,
);

$uo->coercion->add_type_coercions(
	Str, q{ do { package Ubic; $Ubic::SINGLETON ||= $_->new({}) } }
);

my $service_name_re = qr{^[\w-]+(?:\.[\w-]+)*$};

__PACKAGE__->add_type(
	name    => 'ServiceName',
	parent  => StrMatch[ $service_name_re ],
);

1;

=head1 DESCRIPTION

Type constraint library for L<Ubic>, built with L<Type::Library>.

=head2 Type constraints

=over

=item C<UbicObject>

An object, or the string "Ubic". That is, a valid invocant for the class
methods in the Ubic package.

=item C<ServiceName>

A string that is a valid Ubic service name.

=back

=cut
