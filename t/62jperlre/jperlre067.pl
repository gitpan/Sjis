use Sjis;

if ('あ い' =~ /(あ[\s]い)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre067.pl ('あ い' =~ /あ[\s]い/).\n";
    }
    else {
        print "not ok - $^X jperlre067.pl ('あ い' =~ /あ[\s]い/).\n";
    }
}
else {
    print "not ok - $^X jperlre067.pl ('あ い' =~ /あ[\s]い/).\n";
}

__END__

