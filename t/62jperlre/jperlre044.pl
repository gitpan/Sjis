use Sjis;

if ('‚ ‚¤e' =~ /(‚ [‚¢-‚¦]e)/) {
    if ("$1" eq "‚ ‚¤e") {
        print "ok - $^X jperlre044.pl ('‚ ‚¤e' =~ /‚ [‚¢-‚¦]e/).\n";
    }
    else {
        print "not ok - $^X jperlre044.pl ('‚ ‚¤e' =~ /‚ [‚¢-‚¦]e/).\n";
    }
}
else {
    print "not ok - $^X jperlre044.pl ('‚ ‚¤e' =~ /‚ [‚¢-‚¦]e/).\n";
}

__END__

