use Sjis;

if ('‚ ‚ ‚¢‚¤' =~ /(‚ ‚¢‚¤)$/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre033.pl ('‚ ‚ ‚¢‚¤' =~ /‚ ‚¢‚¤\$/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre033.pl ('‚ ‚ ‚¢‚¤' =~ /‚ ‚¢‚¤\$/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre033.pl ('‚ ‚ ‚¢‚¤' =~ /‚ ‚¢‚¤\$/).\n";
}

__END__

