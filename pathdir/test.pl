# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

$| = 1;

system("mkdir D機能 >NUL 2>NUL");
system("echo 1 > D機能\\file1.txt");
system("echo 1 > D機能\\file2.txt");
system("echo 1 > D機能\\file3.txt");

my @script = map {"$_.pl"} (qw(chdir chmod chown glob mkdir opendir qx rename rmdir system utime));
for my $script (@script) {
    if (system("perl -cw $script >NUL 2>NUL") != 0) {
        print "not ok - perl -cw $script\n";
    }
    else {
        system("perl $script");
    }
}

