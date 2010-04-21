use Sjis;

if ('‚ x‚¤' =~ /(‚ ‚¢‚¤)/) {
    print "not ok - $^X jperlre003.pl not ('‚ x‚¤' =~ /‚ ‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre003.pl not ('‚ x‚¤' =~ /‚ ‚¢‚¤/).\n";
}

__END__

