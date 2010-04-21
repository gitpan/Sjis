use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ [‚¢‚¤]‚¦)/) {
    print "not ok - $^X jperlre041.pl not ('‚ ‚¢‚¤' =~ /‚ [‚¢‚¤]‚¦/).\n";
}
else {
    print "ok - $^X jperlre041.pl not ('‚ ‚¢‚¤' =~ /‚ [‚¢‚¤]‚¦/).\n";
}

__END__

