use Sjis;

if ('あいいいいう' =~ /(あい+いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - $^X jperlre018.pl ('あいいいいう' =~ /あい+いう/).\n";
    }
    else {
        print "not ok - $^X jperlre018.pl ('あいいいいう' =~ /あい+いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre018.pl ('あいいいいう' =~ /あい+いう/).\n";
}

__END__

