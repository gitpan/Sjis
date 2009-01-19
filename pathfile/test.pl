# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

$| = 1;

system("echo 1 > F‹@”\");

my @script = map {"$_.pl"} (qw(chmod chown dbmopen do glob lstat open qx rename require stat sysopen system truncate unlink utime));
for my $script (@script) {
    if (system("perl -cw $script >NUL 2>NUL") != 0) {
        print "not ok - perl -cw $script\n";
    }
    else {
        system("perl $script");
    }
}

