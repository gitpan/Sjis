use Sjis;

if ('あいう' =~ /^(あいう)$/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre029.pl ('あいう' =~ /^あいう\$/).\n";
    }
    else {
        print "not ok - $^X jperlre029.pl ('あいう' =~ /^あいう\$/).\n";
    }
}
else {
    print "not ok - $^X jperlre029.pl ('あいう' =~ /^あいう\$/).\n";
}

__END__

