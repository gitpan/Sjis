use Sjis;

eval q< '-' =~ /(‚ []‚¢)/ >;
if ($@) {
    print "ok - $^X jperlre049.pl die ('-' =~ /‚ []‚¢/).\n";
}
else {
    print "not ok - $^X jperlre049.pl die ('-' =~ /‚ []‚¢/).\n";
}

__END__

