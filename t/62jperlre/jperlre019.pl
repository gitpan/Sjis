use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢{1,}‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¢‚¢‚¢‚¤") {
        print "ok - $^X jperlre019.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,}‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre019.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,}‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre019.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,}‚¢‚¤/).\n";
}

__END__

