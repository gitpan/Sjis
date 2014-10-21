# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use strict;
use Sjis;

chomp(my @script = <DATA>);

for my $perlbin (qw(perl55 perl58 perl510)) {
    next unless `$perlbin -v` =~ /This is perl,/;
    print "perlbin=$perlbin\n";

    system("echo > F�@�\ 2>NUL");
    system("mkdir D�@�\ 2>NUL");
    system("echo > D�@�\\\a.txt 2>NUL");
    system("echo > D�@�\\\b.txt 2>NUL");
    system("echo > D�@�\\\c.txt 2>NUL");
    system("echo > D�@�\\\F�@�\ 2>NUL");
    system("mkdir D�@�\\\D�@�\ 2>NUL");

    for my $script (@script) {
        system "$perlbin $script";
    }
    print "\n";
}

__END__
01glob.pl
02opendir.pl
03stat.pl
04filetest.pl
