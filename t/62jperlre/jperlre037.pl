use Sjis;

if ('あいう' =~ /(あ.う)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre037.pl ('あいう' =~ /あ.う/).\n";
    }
    else {
        print "not ok - $^X jperlre037.pl ('あいう' =~ /あ.う/).\n";
    }
}
else {
    print "not ok - $^X jperlre037.pl ('あいう' =~ /あ.う/).\n";
}

__END__

