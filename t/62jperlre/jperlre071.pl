use Sjis;

if ('1' =~ /([\d])/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre071.pl ('1' =~ /[\d]/).\n";
    }
    else {
        print "not ok - $^X jperlre071.pl ('1' =~ /[\d]/).\n";
    }
}
else {
    print "not ok - $^X jperlre071.pl ('1' =~ /[\d]/).\n";
}

__END__

