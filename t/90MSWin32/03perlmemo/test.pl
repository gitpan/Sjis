# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use strict;
$| = 1;

chomp(my @script = <DATA>);

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl/;

    system('echo > F�@�\\ 2>NUL');
    system('mkdir D�@�\\ 2>NUL');
    system('echo > D�@�\\\\a.txt 2>NUL');
    system('echo > D�@�\\\\b.txt 2>NUL');
    system('echo > D�@�\\\\c.txt 2>NUL');
    system('echo > D�@�\\\\F�@�\ 2>NUL');
    system('mkdir D�@�\\\\D�@�\ 2>NUL');

    for my $script (@script) {
        system "$perlbin $script";
        sleep 1;
    }
    print "\n";
}

__END__
01glob.pl
02opendir.pl
03stat.pl
04filetest.pl
