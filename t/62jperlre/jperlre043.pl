use Sjis;

if ('‚ ‚¢‚¦' =~ /(‚ [‚¢-‚¦]e)/) {
    print "not ok - $^X jperlre043.pl not ('‚ ‚¢‚¦' =~ /‚ [‚¢-‚¦]e/).\n";
}
else {
    print "ok - $^X jperlre043.pl not ('‚ ‚¢‚¦' =~ /‚ [‚¢-‚¦]e/).\n";
}

__END__

