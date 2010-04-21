use Sjis;

if ('‚ ‚¦‚¤' =~ /(‚ [^-‚¢]‚¤)/) {
    if ("$1" eq "‚ ‚¦‚¤") {
        print "ok - $^X jperlre055.pl ('‚ ‚¦‚¤' =~ /‚ [^-‚¢]‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre055.pl ('‚ ‚¦‚¤' =~ /‚ [^-‚¢]‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre055.pl ('‚ ‚¦‚¤' =~ /‚ [^-‚¢]‚¤/).\n";
}

__END__

