use Sjis;

if ('あいいいいう' =~ /(あい{1,3}いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - $^X jperlre020.pl ('あいいいいう' =~ /あい{1,3}いう/).\n";
    }
    else {
        print "not ok - $^X jperlre020.pl ('あいいいいう' =~ /あい{1,3}いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre020.pl ('あいいいいう' =~ /あい{1,3}いう/).\n";
}

__END__

