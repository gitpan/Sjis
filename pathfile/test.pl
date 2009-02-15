# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

$| = 1;

my @script = map {"$_.pl"} (qw(chmod chown dbmopen do glob lstat open qx rename require stat sysopen system truncate unlink utime));
for my $perlbin (qw(perl55 perl56 perl58 perl510)) {
    next unless `$perlbin -v` =~ /This is perl,/;
    print "perlbin=$perlbin\n";

    system("echo 1 > F‹@”\");

    for my $script (@script) {
        if (system("$perlbin -cw $script >NUL 2>NUL") != 0) {
            print "not ok - $perlbin -cw $script\n";
        }
        else {
            system("$perlbin $script");
        }
    }
    print "\n";
}

