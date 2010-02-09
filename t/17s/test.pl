use strict;
use Sjis;
$| = 1;

my @script = grep(/^[0-9]/, split(/\n/,`dir /b *.pl 2>NUL`));

for my $perlbin (qw(perl55 perl56 perl58 perl510)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl,/;
    print "\nperlbin=$perlbin\n";

    for my $script (@script) {
        system("$perlbin $script 2>NUL");
    }
}

