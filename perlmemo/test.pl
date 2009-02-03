# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use strict;
use Sjis;

chomp(my @script = <DATA>);

for my $perlbin (qw(perl55 perl58 perl510)) {
    next unless `$perlbin -v` =~ /This is perl,/;
    print "perlbin=$perlbin\n";

    system("echo > F機能 2>NUL");
    system("mkdir D機能 2>NUL");
    system("echo > D機能\\a.txt 2>NUL");
    system("echo > D機能\\b.txt 2>NUL");
    system("echo > D機能\\c.txt 2>NUL");
    system("echo > D機能\\F機能 2>NUL");
    system("mkdir D機能\\D機能 2>NUL");

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
