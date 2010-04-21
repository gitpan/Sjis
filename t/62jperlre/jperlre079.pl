use Sjis;

eval q< '-' =~ /((*)‚¢)/ >;
if ($@) {
    print "ok - $^X jperlre079.pl die ('-' =~ /(*)‚¢/).\n";
}
else {
    print "not ok - $^X jperlre079.pl die ('-' =~ /(*)‚¢/).\n";
}

__END__

