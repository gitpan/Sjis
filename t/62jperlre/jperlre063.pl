use Sjis;

if ('1' =~ /(\d)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre063.pl ('1' =~ /\d/).\n";
    }
    else {
        print "not ok - $^X jperlre063.pl ('1' =~ /\d/).\n";
    }
}
else {
    print "not ok - $^X jperlre063.pl ('1' =~ /\d/).\n";
}

__END__

