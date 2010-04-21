use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ ‚¢*‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre008.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢*‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre008.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢*‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre008.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢*‚¢‚¤/).\n";
}

__END__

