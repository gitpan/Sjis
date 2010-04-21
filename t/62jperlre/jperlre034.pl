use Sjis;

if ('‚ ‚ ‚¢‚¤‚¦' =~ /(‚ ‚¢‚¤)$/) {
    print "not ok - $^X jperlre034.pl not ('‚ ‚ ‚¢‚¤‚¦' =~ /‚ ‚¢‚¤\$/).\n";
}
else {
    print "ok - $^X jperlre034.pl not ('‚ ‚ ‚¢‚¤‚¦' =~ /‚ ‚¢‚¤\$/).\n";
}

__END__

