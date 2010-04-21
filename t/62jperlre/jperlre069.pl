use Sjis;

if ('‚  ‚¢' =~ /(‚ [\S]‚¢)/) {
    print "not ok - $^X jperlre069.pl not ('‚  ‚¢' =~ /‚ [\S]‚¢/).\n";
}
else {
    print "ok - $^X jperlre069.pl not ('‚  ‚¢' =~ /‚ [\S]‚¢/).\n";
}

__END__

