use Sjis;

if ('あ い' =~ /(あ[\S]い)/) {
    print "not ok - $^X jperlre069.pl not ('あ い' =~ /あ[\S]い/).\n";
}
else {
    print "ok - $^X jperlre069.pl not ('あ い' =~ /あ[\S]い/).\n";
}

__END__

