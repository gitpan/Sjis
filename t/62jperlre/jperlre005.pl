use Sjis;

if ('xあいうy' =~ /(あいう)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre005.pl ('xあいうy' =~ /あいう/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre005.pl ('xあいうy' =~ /あいう/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre005.pl ('xあいうy' =~ /あいう/).\n";
}

__END__

