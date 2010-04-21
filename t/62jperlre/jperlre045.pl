use Sjis;

if ('‚ ‚ ‚¤' =~ /(‚ [‚¢-‚¦])/) {
    if ("$1" eq "‚ ‚¤") {
        print "ok - $^X jperlre045.pl ('‚ ‚ ‚¤' =~ /‚ [‚¢-‚¦]/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre045.pl ('‚ ‚ ‚¤' =~ /‚ [‚¢-‚¦]/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre045.pl ('‚ ‚ ‚¤' =~ /‚ [‚¢-‚¦]/).\n";
}

__END__

