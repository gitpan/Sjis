use Sjis;

if ('‚ -‚¢' =~ /‚ [^-]‚¢/) {
    print "not ok - $^X jperlre106.pl ('‚ -‚¢' =~ /‚ [^-]‚¢/)\n";
}
else {
    print "ok - $^X jperlre106.pl ('‚ -‚¢' =~ /‚ [^-]‚¢/)\n";
}

__END__

