use Sjis;

if ('あいう' =~ /()$/) {
    if ("$1" eq "") {
        print "ok - $^X jperlre036.pl ('あいう' =~ /\$/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre036.pl ('あいう' =~ /\$/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre036.pl ('あいう' =~ /\$/).\n";
}

__END__

