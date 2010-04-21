use Sjis;

if ('‚ (‚¢' =~ /‚ \(‚¢/) {
    if ("$&-$1" eq "‚ (‚¢-") {
        print "ok - $^X jperlre082.pl ('‚ (‚¢' =~ /‚ \(‚¢/).\n";
    }
    else {
        print "not ok - $^X jperlre082.pl ('‚ (‚¢' =~ /‚ \(‚¢/).\n";
    }
}
else {
    print "not ok - $^X jperlre082.pl ('‚ (‚¢' =~ /‚ \(‚¢/).\n";
}

__END__

