use Sjis;

if ('‚ e‚¦' =~ /(‚ [^‚¢‚¤]‚¦)/) {
    if ("$1" eq "‚ e‚¦") {
        print "ok - $^X jperlre053.pl ('‚ e‚¦' =~ /‚ [^‚¢‚¤]‚¦/).\n";
    }
    else {
        print "not ok - $^X jperlre053.pl ('‚ e‚¦' =~ /‚ [^‚¢‚¤]‚¦/).\n";
    }
}
else {
    print "not ok - $^X jperlre053.pl ('‚ e‚¦' =~ /‚ [^‚¢‚¤]‚¦/).\n";
}

__END__

