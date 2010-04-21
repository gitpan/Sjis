use Sjis;

if ('‚ -‚¢' =~ /(‚ [\s]‚¢)/) {
    print "not ok - $^X jperlre068.pl not ('‚ -‚¢' =~ /‚ [\s]‚¢/).\n";
}
else {
    print "ok - $^X jperlre068.pl not ('‚ -‚¢' =~ /‚ [\s]‚¢/).\n";
}

__END__

