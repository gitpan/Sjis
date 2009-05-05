@rem = '--*-Perl-*--
@echo off
if "%PERL58BIN%" == "" set PERL58BIN=perl
if "%OS%" == "Windows_NT" goto WinNT
%PERL58BIN% -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
%PERL58BIN% -x -S "%0" %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
exit /b %errorlevel%
goto endofperl
@rem ';
#!perl
#line 16
my $VERSION = "1.0.3"; undef @rem;
######################################################################
#
# perl58 -  execute perlscript on the perl5.8 without %PATH% settings
#
# Copyright (c) 2008, 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use Fcntl;
use Symbol;
use Win32;
use Win32::Registry;

# print usage
unless (@ARGV) {
    die <<END;

$0 ver.$VERSION

usage:

C:\\>$0 perlscript.pl ...

Find perl5.8 order by,
  1st, C:\\Perl58\\bin\\perl.exe
  2nd, D:\\Perl58\\bin\\perl.exe
  3rd, E:\\Perl58\\bin\\perl.exe
                :
                :

When found it, then execute perlscript on the its perl.exe.

END
}

# quote by "" if include space
@ARGV = map { / / ? qq{"$_"} : $_ } @ARGV;

# if this script running under perl5.8
if ($] =~ /^5\.008/) {
    exit system $^X, @ARGV;
}

# execute by environment variable PERL58BIN
if (defined $ENV{'PERL58BIN'} and -e $ENV{'PERL58BIN'}) {
    exit system $ENV{'PERL58BIN'}, @ARGV;
}

# find perl5.8 in the computer
my @perlbin = ();
eval <<'END';
use Win32API::File qw(:DRIVE_);

Win32API::File::GetLogicalDriveStrings(4*26+1, my $LogicalDriveStrings);
for my $driveroot (split /\0/, $LogicalDriveStrings) {
    my $type = Win32API::File::GetDriveType($driveroot);
    # 0 DRIVE_UNKNOWN
    # 1 DRIVE_NO_ROOT_DIR
    # 2 DRIVE_REMOVABLE
    # 3 DRIVE_FIXED
    # 4 DRIVE_REMOTE
    # 5 DRIVE_CDROM
    # 6 DRIVE_RAMDISK
    if (($type == DRIVE_FIXED)  or
        ($type == DRIVE_REMOTE) or
        ($type == DRIVE_RAMDISK)
    ) {
        if (-e "${driveroot}perl58\\bin\\perl.exe") {
            push @perlbin, "${driveroot}perl58\\bin\\perl.exe";
        }
    }
}
END

# get drive list by 'net share' command
# Windows NT, Windows 2000, Windows XP, Windows Server 2003, Windows Vista
# maybe also Windows Server 2008
if ($@) {
    while (`net share 2>NUL` =~ /\b([A-Z])\$ +\1:\\ +Default share\b/ig) {
        if (-e "$1:\\perl58\\bin\\perl.exe") {
            push @perlbin, "$1:\\perl58\\bin\\perl.exe";
        }
    }
}

my $perlbin;

# perl5.8 not found
if (@perlbin == 0) {
    die "$0: nothing \\Perl58\\bin\\perl.exe nowhere.\n";
}

# only one perl5.8 found
elsif (@perlbin == 1) {
    $perlbin = $perlbin[0];
}

# if many perl5.8 found
elsif (@perlbin > 1) {

    # select one perl.exe
    print STDERR "This computer has many perl.exe.\n";
    print STDERR map {"$_\n"} @perlbin;
    print STDERR "Which perl.exe do you use? (exit by [Ctrl]+[C])";
    while (1) {
        print STDERR "drive = ";
        my $drive = <STDIN>;
        $drive = substr($drive,0,1);
        if (($perlbin) = grep /^$drive/i, @perlbin) {
            last;
        }
    }
}

# register environment variable PERL58BIN
if (Win32::IsWinNT) {
    my $ENVIRONMENT_KEY = 'SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment';
    my $Environment = 0;
    if ($main::HKEY_LOCAL_MACHINE->Open($ENVIRONMENT_KEY, $Environment)) {
        $Environment->SetValueEx('PERL58BIN', 0, REG_SZ, $perlbin);
    }
}
else {
    my $fh = Symbol::gensym();
    if (sysopen($fh, substr($ENV{'WINDIR'},0,2) . '\\AUTOEXEC.BAT', O_WRONLY | O_APPEND | O_CREAT)) {
        print {$fh} "SET PERL58BIN=$perlbin\n";
        close $fh;
    }
}

exit system $perlbin, @ARGV;

__END__

=pod

=head1 NAME

perl58 - execute perlscript on the perl5.8 without %PATH% settings

=head1 SYNOPSIS

B<perl58> [perlscript.pl]

=head1 DESCRIPTION

This program is useful when perl5.5 and perl5.8 are on the one computer.
Set perl5.5's bin directory to environment variable %PATH%, do not set perl5.8's
bin directory to %PATH%.

It is necessary to install perl5.8 in "\Perl58\bin" directory of the drive of
either. This program is executed by perl5.5, and find the perl5.8 and execute it.

 Find perl5.8 order by,
   1st, C:\Perl58\bin\perl.exe
   2nd, D:\Perl58\bin\perl.exe
   3rd, E:\Perl58\bin\perl.exe
                 :
                 :

When found it, then execute perlscript on the its perl.exe.

=head1 EXAMPLES

    C:\> perl58 foo.pl
    [..execute foo.pl by perl5.8..]

=head1 BUGS AND LIMITATIONS

Please patches and report problems to author are welcome.

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

perl

=cut

:endofperl
