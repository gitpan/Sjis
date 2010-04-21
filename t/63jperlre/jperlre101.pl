use Sjis;

if ('‚ -‚¢' =~ /‚ [-]‚¢/) {
    print "ok - $^X jperlre101.pl ('‚ -‚¢' =~ /‚ [-]‚¢/)\n";
}
else {
    print "not ok - $^X jperlre101.pl ('‚ -‚¢' =~ /‚ [-]‚¢/)\n";
}

__END__

