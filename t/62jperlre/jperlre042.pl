use Sjis;

if ('‚ ‚¢‚¦' =~ /(‚ [‚¢‚¤]‚¦)/) {
    if ("$1" eq "‚ ‚¢‚¦") {
        print "ok - $^X jperlre042.pl ('‚ ‚¢‚¦' =~ /‚ [‚¢‚¤]‚¦/).\n";
    }
    else {
        print "not ok - $^X jperlre042.pl ('‚ ‚¢‚¦' =~ /‚ [‚¢‚¤]‚¦/).\n";
    }
}
else {
    print "not ok - $^X jperlre042.pl ('‚ ‚¢‚¦' =~ /‚ [‚¢‚¤]‚¦/).\n";
}

__END__

