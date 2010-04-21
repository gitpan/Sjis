use Sjis;

if ('‚ ‚¦‚¤' =~ /(‚ [^]‚¢]‚¤)/) {
    if ("$1" eq "‚ ‚¦‚¤") {
        print "ok - $^X jperlre058.pl ('‚ ‚¦‚¤' =~ /‚ [^]‚¢]‚¤/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre058.pl ('‚ ‚¦‚¤' =~ /‚ [^]‚¢]‚¤/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre058.pl ('‚ ‚¦‚¤' =~ /‚ [^]‚¢]‚¤/).\n";
}

__END__

