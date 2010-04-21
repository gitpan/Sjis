use Sjis;

if ('‚ ^‚¢' =~ /‚ [^^]‚¢/) {
    print "not ok - $^X jperlre109.pl ('‚ ^‚¢' =~ /‚ [^^]‚¢/)\n";
}
else {
    print "ok - $^X jperlre109.pl ('‚ ^‚¢' =~ /‚ [^^]‚¢/)\n";
}

__END__

