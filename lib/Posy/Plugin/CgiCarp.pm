package Posy::Plugin::CgiCarp;
use strict;
use warnings;

=head1 NAME

Posy::Plugin::CgiCarp - Posy plugin to aid debugging by using CGI::Carp.

=head1 VERSION

This describes version B<0.60> of Posy::Plugin::CgiCarp.

=cut

our $VERSION = '0.60';

=head1 SYNOPSIS

    @plugins = qw(Posy::Core
	...
	Posy::Plugin::CgiCarp));

=head1 DESCRIPTION

This plugin is for developers to aid debugging by making all fatal errors
and warning messages be displayed in the browser by using the CGI::Carp
module.

=head2 Activation

This plugin needs to be added to the plugins list.

This replaces the 'debug' and 'print_header' methods; note that
if a plugin needs to print a header (such as, if, for example,
it replaces the 'render_page' method) then it should call the
'print_header' method.

=cut
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);

=head1 Helper Methods

Methods which can be called from within other methods.

=head2 print_header

    $self->print_header(content_type=>$content_type,
	status=>$status,
	extra=>$extra);

Print a web-page header, with content-type and any extra things
required for the header.
Turns on warningsToBrowser.

=cut
sub print_header {
    my $self = shift;

    $self->SUPER::print_header($self, @_);
    warningsToBrowser(1);
} # print_header

=head2 debug

Print a debug message (for debugging)
Checks $self->{'debug_level'}

=cut
sub debug {
    my $self = shift;
    my $level = shift;
    my $message = shift;

    if ($level <= $self->{'debug_level'})
    {
	carp "DEBUG: ", $message;
    }
} # debug

=head1 REQUIRES

    CGI::Carp
    Posy::Core
    Posy

    Test::More

=head1 SEE ALSO

perl(1).
Posy

=head1 BUGS

Please report any bugs or feature requests to the author.

=head1 AUTHOR

    Kathryn Andersen (RUBYKAT)
    perlkat AT katspace dot com
    http://www.katspace.com

=head1 COPYRIGHT AND LICENCE

Copyright (c) 2004-2005 by Kathryn Andersen

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Posy::Plugin::CgiCarp
__END__
