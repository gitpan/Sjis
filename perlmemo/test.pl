# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

system("echo > F�@�\ 2>NUL");
system("mkdir D�@�\ 2>NUL");
system("echo > D�@�\\\a.txt 2>NUL");
system("echo > D�@�\\\b.txt 2>NUL");
system("echo > D�@�\\\c.txt 2>NUL");
system("echo > D�@�\\\F�@�\ 2>NUL");
system("mkdir D�@�\\\D�@�\ 2>NUL");

while (<DATA>) {
    chomp;
    system "perl $_";
}

__END__
01glob.pl
02opendir.pl
03stat.pl
04filetest.pl
