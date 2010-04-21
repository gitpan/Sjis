use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ ‚¢{0,1}‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre025.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢{0,1}‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre025.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢{0,1}‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre025.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢{0,1}‚¢‚¤/).\n";
}

__END__

