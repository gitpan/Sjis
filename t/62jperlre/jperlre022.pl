use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(‚ ‚¢{4,5}‚¢‚¤)/) {
    print "not ok - $^X jperlre022.pl not ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{4,5}‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre022.pl not ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /‚ ‚¢{4,5}‚¢‚¤/).\n";
}

__END__

