use Sjis;

if ('‚  ‚¢' =~ /(‚ [\s]‚¢)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre067.pl ('‚  ‚¢' =~ /‚ [\s]‚¢/).\n";
    }
    else {
        print "not ok - $^X jperlre067.pl ('‚  ‚¢' =~ /‚ [\s]‚¢/).\n";
    }
}
else {
    print "not ok - $^X jperlre067.pl ('‚  ‚¢' =~ /‚ [\s]‚¢/).\n";
}

__END__

