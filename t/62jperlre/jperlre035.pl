use Sjis;

if ('‚ ‚¢‚¤' =~ /^()/) {
    if ("$1" eq "") {
        print "ok - $^X jperlre035.pl ('‚ ‚¢‚¤' =~ /^/).\n";
    }
    else {
        print "not ok - $^X jperlre035.pl ('‚ ‚¢‚¤' =~ /^/).\n";
    }
}
else {
    print "not ok - $^X jperlre035.pl ('‚ ‚¢‚¤' =~ /^/).\n";
}

__END__

