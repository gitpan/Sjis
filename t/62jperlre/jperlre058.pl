use Sjis;

if ('あえう' =~ /(あ[^]い]う)/) {
    if ("$1" eq "あえう") {
        print "ok - $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
}

__END__

