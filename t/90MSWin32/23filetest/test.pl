$| = 1;

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl,/;

    for my $n (qw(01 02 03 04 05 06 07)) {
        system("$perlbin filetest-$n.pl > smoke-filetest-$n.pl");
        system("$perlbin smoke-filetest-$n.pl");
#       system("pause");
    }
}
