use Sjis;

if ('あ]い' =~ /(あ[]]い)/) {
    if ("$1" eq "あ]い") {
        print "ok - $^X jperlre052.pl ('あ]い' =~ /あ[]]い/).\n";
    }
    else {
        print "not ok - $^X jperlre052.pl ('あ]い' =~ /あ[]]い/).\n";
    }
}
else {
    print "not ok - $^X jperlre052.pl ('あ]い' =~ /あ[]]い/).\n";
}

__END__

