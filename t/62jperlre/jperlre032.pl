use Sjis;

if ('‚ ‚ ‚¢‚¤' =~ /^(‚ ‚¢‚¤)$/) {
    print "not ok - $^X jperlre032.pl not ('‚ ‚ ‚¢‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
}
else {
    print "ok - $^X jperlre032.pl not ('‚ ‚ ‚¢‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
}

__END__

