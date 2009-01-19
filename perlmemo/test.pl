# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

system("echo > F機能 2>NUL");
system("mkdir D機能 2>NUL");
system("echo > D機能\\a.txt 2>NUL");
system("echo > D機能\\b.txt 2>NUL");
system("echo > D機能\\c.txt 2>NUL");
system("echo > D機能\\F機能 2>NUL");
system("mkdir D機能\\D機能 2>NUL");

while (<DATA>) {
    chomp;
    system "perl $_";
}

__END__
01glob.pl
02opendir.pl
03stat.pl
04filetest.pl
