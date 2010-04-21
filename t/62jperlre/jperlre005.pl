use Sjis;

if ('x‚ ‚¢‚¤y' =~ /(‚ ‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre005.pl ('x‚ ‚¢‚¤y' =~ /‚ ‚¢‚¤/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre005.pl ('x‚ ‚¢‚¤y' =~ /‚ ‚¢‚¤/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre005.pl ('x‚ ‚¢‚¤y' =~ /‚ ‚¢‚¤/).\n";
}

__END__

