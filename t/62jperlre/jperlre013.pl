use Sjis;

if ('あいいいいう' =~ /(あい{0,}いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - $^X jperlre013.pl ('あいいいいう' =~ /あい{0,}いう/).\n";
    }
    else {
        print "not ok - $^X jperlre013.pl ('あいいいいう' =~ /あい{0,}いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre013.pl ('あいいいいう' =~ /あい{0,}いう/).\n";
}

__END__

