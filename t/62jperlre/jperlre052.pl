use Sjis;

if ('‚ ]‚¢' =~ /(‚ []]‚¢)/) {
    if ("$1" eq "‚ ]‚¢") {
        print "ok - $^X jperlre052.pl ('‚ ]‚¢' =~ /‚ []]‚¢/).\n";
    }
    else {
        print "not ok - $^X jperlre052.pl ('‚ ]‚¢' =~ /‚ []]‚¢/).\n";
    }
}
else {
    print "not ok - $^X jperlre052.pl ('‚ ]‚¢' =~ /‚ []]‚¢/).\n";
}

__END__

