use Sjis;

if ('‚ ‚¢x' =~ /(‚ ‚¢‚¤)/) {
    print "not ok - $^X jperlre004.pl not ('‚ ‚¢x' =~ /‚ ‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre004.pl not ('‚ ‚¢x' =~ /‚ ‚¢‚¤/).\n";
}

__END__

