use Sjis;

if ('あいう' =~ /^()/) {
    if ("$1" eq "") {
        print "ok - $^X jperlre035.pl ('あいう' =~ /^/).\n";
    }
    else {
        print "not ok - $^X jperlre035.pl ('あいう' =~ /^/).\n";
    }
}
else {
    print "not ok - $^X jperlre035.pl ('あいう' =~ /^/).\n";
}

__END__

