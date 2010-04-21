use Sjis;

eval q< '-' =~ /‚ \/ >;
if ($@) {
    print "ok - $^X jperlre081.pl die ('-' =~ /‚ \\/).\n";
}
else {
    print "not ok(b) - $^X jperlre081.pl die ('-' =~ /‚ \\/).\n";
}

__END__

