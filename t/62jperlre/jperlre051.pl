use Sjis;

if ('あ]' =~ /(あ])/) {
    if ("$1" eq "あ]") {
        print "ok - $^X jperlre051.pl ('あ]' =~ /あ]/).\n";
    }
    else {
        print "not ok - $^X jperlre051.pl ('あ]' =~ /あ]/).\n";
    }
}
else {
    print "not ok - $^X jperlre051.pl ('あ]' =~ /あ]/).\n";
}

__END__

