use Sjis;

if ('-' =~ /(\D)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre066.pl ('-' =~ /\D/).\n";
    }
    else {
        print "not ok - $^X jperlre066.pl ('-' =~ /\D/).\n";
    }
}
else {
    print "not ok - $^X jperlre066.pl ('-' =~ /\D/).\n";
}

__END__

