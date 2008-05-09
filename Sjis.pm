package Sjis;
######################################################################
#
# Sjis - Source code filter for ShiftJIS script
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.16 $ =~ m/(\d+)/xmsg;

sub import() {}
sub unimport() {}

# when running under jperl
if ($^X =~ m/jperl/xmsi) {

    # NOP
    1;
}

# when running under perl
else {
    my $script = (caller)[1];

    # exists script.e
    if (-e qq{$script.e}) {
        my $mtime = (stat(qq{$script.e}))[9];

        # if script.e is older than other files
        if (($mtime < (stat($script))             [9]) or
            ($mtime < (stat(&abspath('esjis.pl')))[9]) or
            ($mtime < (stat(&abspath('Esjis.pm')))[9]) or
            ($mtime < (stat(&abspath('Sjis.pm'))) [9])
        ) {

            # check before filter if jperl exists
            if (system(qq{jperl -v > NUL}) == 0) {
                if ((my $rc = system(qq{jperl -c $script})) != 0) {
                    exit $rc;
                }
            }

            # escape script
            if (system(qq{$^X -S esjis.pl $script > $script.e}) != 0) {
                die "Sjis: Can't escape $script\n";
            }
        }
    }

    # not exists script.e
    else {

        # check before filter if jperl exists
        if (system(qq{jperl -v > NUL}) == 0) {
            if ((my $rc = system(qq{jperl -c $script})) != 0) {
                exit $rc;
            }
        }

        # escape script
        if (system(qq{$^X -S esjis.pl $script > $script.e}) != 0) {
            die "Sjis: Can't escape $script\n";
        }
    }

    # exit with return code
    exit system($^X, "$script.e", @ARGV);
}

# find absolute path
sub abspath($) {
    my($file) = @_;

    # when .pl file
    if ($file =~ m/\.pl$/xmsi) {
        if (-e $file) {
            return $file;
        }
        for my $dir (split /;/, $ENV{'PATH'}) {
            if (-e qq{$dir\\$file}) {
                return qq{$dir\\$file};
            }
        }
    }

    # when .pm file
    elsif ($file =~ m/\.pm$/xmsi) {
        for my $dir (@INC) {
            $dir =~ s#/#\\#g;
            if (-e qq{$dir\\$file}) {
                return qq{$dir\\$file};
            }
        }
    }

    die "Can't find file: $file\n";
}

__END__
=pod

=head1 NAME

Sjis - Source code filter for ShiftJIS script

=head1 SYNOPSIS

  use Sjis;

  # "no Sjis;" not supported

=head1 ABSTRACT

By describing, "use Sjis;" in your script, jperl55.bat, jperl58.bat and jperl510.bat
becomes unnecessary.

=head1 BUGS AND LIMITATIONS

This software is still an alpha version for expressing a concept.

Please test code, patches and report problems to author are welcome.

=head1 HISTORY

This software first appeared in ActivePerl Build 522 Built under MSWin32
Compiled at Nov 2 1999 09:52:28

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This software is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut

