use Sjis;

if ('‚ ‚¢q' =~ /(‚ ‚¢{1,}‚¢‚¤)/) {
    print "not ok - $^X jperlre017.pl not ('‚ ‚¢q' =~ /‚ ‚¢{1,}‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre017.pl not ('‚ ‚¢q' =~ /‚ ‚¢{1,}‚¢‚¤/).\n";
}

__END__

