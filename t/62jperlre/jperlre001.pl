use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ ‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre001.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre001.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre001.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢‚¤/).\n";
}

__END__

