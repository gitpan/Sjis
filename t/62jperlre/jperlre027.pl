use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ ‚¢?‚¤)/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre027.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢?‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre027.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢?‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre027.pl ('‚ ‚¢‚¤' =~ /‚ ‚¢?‚¤/).\n";
}

__END__

