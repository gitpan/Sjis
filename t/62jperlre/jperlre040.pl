use Sjis;

if ('‚ xyz‚¦' =~ /(‚ .*‚¤)/) {
    print "not ok - $^X jperlre040.pl not ('‚ xyz‚¦' =~ /‚ .*‚¤/).\n";
}
else {
    print "ok - $^X jperlre040.pl not ('‚ xyz‚¦' =~ /‚ .*‚¤/).\n";
}

__END__

