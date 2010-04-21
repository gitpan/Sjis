use Sjis;

if ('‚ ‚¢‚¤' =~ /^(‚ ‚¢‚¤)$/) {
    if ("$1" eq "‚ ‚¢‚¤") {
        print "ok - $^X jperlre029.pl ('‚ ‚¢‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
    }
    else {
        print "not ok - $^X jperlre029.pl ('‚ ‚¢‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
    }
}
else {
    print "not ok - $^X jperlre029.pl ('‚ ‚¢‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
}

__END__

