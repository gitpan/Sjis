use Sjis;

if ('あいいいいう' =~ /(あい{1,}いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - $^X jperlre019.pl ('あいいいいう' =~ /あい{1,}いう/).\n";
    }
    else {
        print "not ok - $^X jperlre019.pl ('あいいいいう' =~ /あい{1,}いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre019.pl ('あいいいいう' =~ /あい{1,}いう/).\n";
}

__END__

