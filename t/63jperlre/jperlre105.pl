use Sjis;

if ('‚ A]‚¢' =~ /‚ [^]]‚¢/) {
    print "not ok - $^X jperlre105.pl ('‚ A]‚¢' =~ /‚ [^]]‚¢/)\n";
}
else {
    print "ok - $^X jperlre105.pl ('‚ A]‚¢' =~ /‚ [^]]‚¢/)\n";
}

__END__

