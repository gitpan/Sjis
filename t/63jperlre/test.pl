use strict;
$| = 1;

my @script = split(/\n/,`dir /b jperl*.pl 2>NUL`);

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl/;
    for my $script (@script) {
        system("$perlbin $script 2>NUL");
    }
}

