use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢{1,3}‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¢‚¢‚¢‚¤") {
        print "ok - $^X jperlre020.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,3}‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre020.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,3}‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre020.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{1,3}‚¢‚¤/).\n";
}

__END__

