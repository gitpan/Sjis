use Sjis;

if ('‚ ‚¢‚¦' =~ /(‚ [^‚¢‚¤]‚¦)/) {
    print "not ok - $^X jperlre054.pl not ('‚ ‚¢‚¦' =~ /‚ [^‚¢‚¤]‚¦/).\n";
}
else {
    print "ok - $^X jperlre054.pl not ('‚ ‚¢‚¦' =~ /‚ [^‚¢‚¤]‚¦/).\n";
}

__END__

