use Sjis;

if ('あいいいいう' =~ /(あい{3,4}いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
    }
    else {
        print "not ok - $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
}

__END__

