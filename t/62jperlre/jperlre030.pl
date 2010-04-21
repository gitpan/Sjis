use Sjis;

if ('‚ ‚¢‚¤‚¤' =~ /^(‚ ‚¢‚¤)$/) {
    print "not ok - $^X jperlre030.pl not ('‚ ‚¢‚¤‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
}
else {
    print "ok - $^X jperlre030.pl not ('‚ ‚¢‚¤‚¤' =~ /^‚ ‚¢‚¤\$/).\n";
}

__END__

