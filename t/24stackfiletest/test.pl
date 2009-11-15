for my $perlbin (qw(perl55 perl56 perl58 perl510)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl,/;

    for my $n (qw(01)) {
        print "\nperlbin=$perlbin\n";
        system("$perlbin stackfiletest-$n.pl");
    }
}

