use Sjis;

eval q< '-' =~ /(あ[]い)/ >;
if ($@) {
    print "ok - $^X jperlre049.pl die ('-' =~ /あ[]い/).\n";
}
else {
    print "not ok - $^X jperlre049.pl die ('-' =~ /あ[]い/).\n";
}

__END__

