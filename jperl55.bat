@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S "%0" %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
exit /b %errorlevel%
goto endofperl
@rem ';
#!perl
#line 15
$VERSION = "1.0.0"; undef @rem;
######################################################################
#
# jperl55 -  execute ShiftJIS perlscript on the perl5.5
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

# print usage
unless (@ARGV) {
    die <<END;

$0 ver.$VERSION

usage:

C:\\>$0 perlscript.pl ...

END
}

# quote by "" if include space
for (@ARGV) {
    $_ = qq{"$_"} if / /;
}

# compile script
for (@ARGV) {
    next if /^-/; # skip command line option

    if (not -e $_) {
        die "jperl55: script $_ is not exists.";
    }
    else {

        # if new *.e file exists
        if ((-e "$_.e") and ((stat("$_.e"))[9] > (stat($_))[9]) and ((stat("$_.e"))[9] > (stat(&abspath('esjis.pl')))[9])) {
            $_ = "$_.e";
            last;
        }

        # make temp filename
        do {
            $tmpnam = sprintf('%s.%d.%d', $_, time, rand(10000));
        } while (-e $tmpnam);

        # escape ShiftJIS of script
        if (system(qq{$^X -S esjis.pl $_ > $tmpnam}) == 0) {
            rename($tmpnam,"$_.e") or unlink $tmpnam;
        }
        else {
            unlink $tmpnam;
            die "jperl55: Can't execute script: $_";
        }
    }

    # rewrite script filename
    $_ = "$_.e";
    last;
}

# if this script running under perl5.5
if ($] =~ /^5\.005/) {
    exit system($^X, @ARGV);
}
else {
    die "jperl55: nothing perl5.5.\n";
}

# find absolute path
sub abspath($) {
    my($file) = @_;

    if (-e $file) {
        return $file;
    }

    # -S option
    for my $dir (split /;/, $ENV{'PATH'}) {
        if (-e qq{$dir\\$file}) {
            return qq{$dir\\$file};
        }
    }

    die "Can't find file: $file\n";
}

__END__
=pod

=head1 NAME

jperl55 - execute ShiftJIS perlscript on the perl5.5

=head1 SYNOPSIS

B<jperl55> [perlscript.pl]

=head1 DESCRIPTION

This utility converts a ShiftJIS perl script into a escaped script that
can be executed by original perl5.5 on DOS-like operating systems.

If the up-to-date escaped file already exists, it is not made again.

=head1 EXAMPLES

    C:\> jperl55 foo.pl
    [..creates foo.pl.e and execute it..]

=head1 BUGS AND LIMITATIONS

This software is still an alpha version for expressing a concept.
Please test code, patches and report problems to author are welcome.

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

=head1 SEE ALSO

perl, esjis.pl

=cut

:endofperl
