for my $perlbin (qw(perl55 perl58 perl510)) {
    next unless `$perlbin -v` =~ /This is perl,/;

    for my $n (qw(01 02 03 04 05 06 07)) {
        print "perlbin=$perlbin\n";
        system("$perlbin filetest-$n.pl > smoke-filetest-$n.pl");
        system("$perlbin smoke-filetest-$n.pl");
        system("pause");
    }
}

