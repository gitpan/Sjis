use Sjis;

if ('‚ -‚¤' =~ /(‚ [^-‚¢]‚¤)/) {
    print "not ok - $^X jperlre056.pl not ('‚ -‚¤' =~ /‚ [^-‚¢]‚¤/).\n";
}
else {
    print "ok - $^X jperlre056.pl not ('‚ -‚¤' =~ /‚ [^-‚¢]‚¤/).\n";
}

__END__

