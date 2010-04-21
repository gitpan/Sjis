use Sjis;

if ('‚ ]‚¤' =~ /(‚ [^]‚¢]‚¤)/) {
    print "not ok - $^X jperlre057.pl not ('‚ ]‚¤' =~ /‚ [^]‚¢]‚¤/).\n";
}
else {
    print "ok - $^X jperlre057.pl not ('‚ ]‚¤' =~ /‚ [^]‚¢]‚¤/).\n";
}

__END__

