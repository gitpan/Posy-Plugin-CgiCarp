package Posy::Plugin::CgiCarp;
use strict;
use warnings;

=head1 NAME

Posy::Plugin::CgiCarp - Posy plugin to aid debugging by using CGI::Carp.

=head1 VERSION

This describes version B<0.61> of Posy::Plugin::CgiCarp.

=cut

our $VERSION = '0.61';

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

=head1 INSTALLATION

Installation needs will vary depending on the particular setup a person
has.

=head2 Administrator, Automatic

If you are the administrator of the system, then the dead simple method of
installing the modules is to use the CPAN or CPANPLUS system.

    cpanp -i Posy::Plugin::CgiCarp

This will install this plugin in the usual places where modules get
installed when one is using CPAN(PLUS).

=head2 Administrator, By Hand

If you are the administrator of the system, but don't wish to use the
CPAN(PLUS) method, then this is for you.  Take the *.tar.gz file
and untar it in a suitable directory.

To install this module, run the following commands:

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

Or, if you're on a platform (like DOS or Windows) that doesn't like the
"./" notation, you can do this:

   perl Build.PL
   perl Build
   perl Build test
   perl Build install

=head2 User With Shell Access

If you are a user on a system, and don't have root/administrator access,
you need to install Posy somewhere other than the default place (since you
don't have access to it).  However, if you have shell access to the system,
then you can install it in your home directory.

Say your home directory is "/home/fred", and you want to install the
modules into a subdirectory called "perl".

Download the *.tar.gz file and untar it in a suitable directory.

    perl Build.PL --install_base /home/fred/perl
    ./Build
    ./Build test
    ./Build install

This will install the files underneath /home/fred/perl.

You will then need to make sure that you alter the PERL5LIB variable to
find the modules, and the PATH variable to find the scripts (posy_one,
posy_static).

Therefore you will need to change:
your path, to include /home/fred/perl/script (where the script will be)

	PATH=/home/fred/perl/script:${PATH}

the PERL5LIB variable to add /home/fred/perl/lib

	PERL5LIB=/home/fred/perl/lib:${PERL5LIB}

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
