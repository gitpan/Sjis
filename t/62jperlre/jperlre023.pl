use Sjis;

if ('あいいう' =~ /(あい?いう)/) {
    if ("$1" eq "あいいう") {
        print "ok - $^X jperlre023.pl ('あいいう' =~ /あい?いう/).\n";
    }
    else {
        print "not ok - $^X jperlre023.pl ('あいいう' =~ /あい?いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre023.pl ('あいいう' =~ /あい?いう/).\n";
}

__END__

