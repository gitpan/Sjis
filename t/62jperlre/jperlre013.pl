use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢{0,}‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¢‚¢‚¢‚¤") {
        print "ok - $^X jperlre013.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{0,}‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre013.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{0,}‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre013.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{0,}‚¢‚¤/).\n";
}

__END__

