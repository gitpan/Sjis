# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
$| = 1;

my @script = map {"$_.pl"} (qw(chdir chmod chown glob mkdir opendir qx rename rmdir system utime));
for my $perlbin (qw(perl55 perl56 perl58 perl510)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl,/;
    print "\nperlbin=$perlbin\n";

    system("mkdir directory >NUL 2>NUL");
    system("mkdir D機能 >NUL 2>NUL");
    system("echo 1 > D機能\\file1.txt");
    system("echo 1 > D機能\\file2.txt");
    system("echo 1 > D機能\\file3.txt");

    for my $script (@script) {
        if (system("$perlbin -cw $script >NUL 2>NUL") != 0) {
            print "not ok - $perlbin -cw $script\n";
        }
        else {
            system("$perlbin $script");
        }
    }
}

