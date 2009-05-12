use ExtUtils::MakeMaker;

my @paths = grep { -x "$_/gpg" } split /:/, $ENV{PATH};

unless ( scalar @paths ) {
    print <<EOD;
I cannot find the "gpg" binary on your system and so won't install. If gpg is installed 
set \$ENV{PATH} to include where it can be found and try installing again. If it's not 
installed you can get a copy from http://www.gnupg.org/
EOD
    exit(0);
}

WriteMakefile(
    'NAME'         => 'GnuPG',
    'VERSION_FROM' => 'GnuPG.pm',
    'EXE_FILES'    => [ gpgmailtunl ],
    'LICENSE'      => 'GPL',
    'ABSTRACT'     => 'Inteface the GNU Privacy Guard',
);