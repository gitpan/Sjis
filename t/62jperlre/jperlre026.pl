use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢?‚¢‚¤)/) {
    print "not ok - $^X jperlre026.pl not ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢?‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre026.pl not ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢?‚¢‚¤/).\n";
}

__END__

