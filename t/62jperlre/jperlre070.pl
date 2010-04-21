use Sjis;

if ('‚ -‚¢' =~ /(‚ [\S]‚¢)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre070.pl ('‚ -‚¢' =~ /‚ [\S]‚¢/).\n";
    }
    else {
        print "not ok - $^X jperlre070.pl ('‚ -‚¢' =~ /‚ [\S]‚¢/).\n";
    }
}
else {
    print "not ok - $^X jperlre070.pl ('‚ -‚¢' =~ /‚ [\S]‚¢/).\n";
}

__END__

