use Sjis;

if ('‚ -‚¢' =~ /(‚ \s‚¢)/) {
    print "not ok - $^X jperlre060.pl not ('‚ -‚¢' =~ /‚ \s‚¢/).\n";
}
else {
    print "ok - $^X jperlre060.pl not ('‚ -‚¢' =~ /‚ \s‚¢/).\n";
}

__END__

