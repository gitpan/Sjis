use Sjis;

if ('‚ ‚¢q' =~ /(‚ ‚¢+‚¢‚¤)/) {
    print "not ok - $^X jperlre016.pl not ('‚ ‚¢q' =~ /‚ ‚¢+‚¢‚¤/).\n";
}
else {
    print "ok - $^X jperlre016.pl not ('‚ ‚¢q' =~ /‚ ‚¢+‚¢‚¤/).\n";
}

__END__

