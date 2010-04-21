use Sjis;

if ('‚ A‚¢' =~ /‚ [^-]‚¢/) {
    print "ok - $^X jperlre103.pl ('‚ A‚¢' =~ /‚ [^-]‚¢/)\n";
}
else {
    print "not ok - $^X jperlre103.pl ('‚ A‚¢' =~ /‚ [^-]‚¢/)\n";
}

__END__

