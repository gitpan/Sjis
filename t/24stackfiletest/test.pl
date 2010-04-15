$| = 1;

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl/;

    for my $n (qw(01)) {
        system("$perlbin stackfiletest-$n.pl");
    }
}

