use Sjis;

if ('‚ -‚¢' =~ /(‚ \S‚¢)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre062.pl ('‚ -‚¢' =~ /‚ \S‚¢/).\n";
    }
    else {
        print "not ok - $^X jperlre062.pl ('‚ -‚¢' =~ /‚ \S‚¢/).\n";
    }
}
else {
    print "not ok - $^X jperlre062.pl ('‚ -‚¢' =~ /‚ \S‚¢/).\n";
}

__END__

