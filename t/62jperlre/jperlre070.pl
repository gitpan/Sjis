use Sjis;

if ('あ-い' =~ /(あ[\S]い)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre070.pl ('あ-い' =~ /あ[\S]い/).\n";
    }
    else {
        print "not ok - $^X jperlre070.pl ('あ-い' =~ /あ[\S]い/).\n";
    }
}
else {
    print "not ok - $^X jperlre070.pl ('あ-い' =~ /あ[\S]い/).\n";
}

__END__

