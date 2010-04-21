use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢+‚¢‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¢‚¢‚¢‚¤") {
        print "ok - $^X jperlre018.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢+‚¢‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre018.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢+‚¢‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre018.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢+‚¢‚¤/).\n";
}

__END__

