use Sjis;

if ('あ-' =~ /(あ[-い])/) {
    if ("$1" eq "あ-") {
        print "ok - $^X jperlre046.pl ('あ-' =~ /あ[-い]/).\n";
    }
    else {
        print "not ok - $^X jperlre046.pl ('あ-' =~ /あ[-い]/).\n";
    }
}
else {
    print "not ok - $^X jperlre046.pl ('あ-' =~ /あ[-い]/).\n";
}

__END__

