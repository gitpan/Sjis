use Sjis;

if ('‚ ‚¢‚¤' =~ /(‚ ‚¢+‚¢‚¤)/) {
    print "not ok - $^X jperlre015.pl not ('‚ ‚¢‚¤' =~ /‚ ‚¢+‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre015.pl not ('‚ ‚¢‚¤' =~ /‚ ‚¢+‚¢‚¤/).\n";
}

__END__

