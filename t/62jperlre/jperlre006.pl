use Sjis;

if ('あいあいう' =~ /(あいう)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre006.pl ('あいあいう' =~ /あいう/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre006.pl ('あいあいう' =~ /あいう/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre006.pl ('あいあいう' =~ /あいう/).\n";
}

__END__

