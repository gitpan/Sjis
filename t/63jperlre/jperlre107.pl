use Sjis;

if ('‚ ]‚¢' =~ /‚ [^]]‚¢/) {
    print "not ok - $^X jperlre107.pl ('‚ ]‚¢' =~ /‚ [^]]‚¢/)\n";
}
else {
    print "ok - $^X jperlre107.pl ('‚ ]‚¢' =~ /‚ [^]]‚¢/)\n";
}

__END__

