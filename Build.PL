use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Posy::Plugin::CgiCarp',
    license             => 'perl',
    dist_author         => 'Kathryn Andersen',
    dist_version_from   => 'lib/Posy/Plugin/CgiCarp.pm',
	requires            => {
	'Posy' => 0.80,
	'CGI::Carp' => 1.27,
	},
    build_requires => {
        'Test::More' => 0,
    },
);

$builder->create_build_script();
