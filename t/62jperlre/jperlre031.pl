use Sjis;

if ('あいうう' =~ /^(あいう)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre031.pl ('あいうう' =~ /^あいう/).\n";
    }
    else {
        print "not ok - $^X jperlre031.pl ('あいうう' =~ /^あいう/).\n";
    }
}
else {
    print "not ok - $^X jperlre031.pl ('あいうう' =~ /^あいう/).\n";
}

__END__

