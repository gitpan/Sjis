use Sjis;

if ('あいう' =~ /(あい*いう)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre008.pl ('あいう' =~ /あい*いう/).\n";
    }
    else {
        print "not ok - $^X jperlre008.pl ('あいう' =~ /あい*いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre008.pl ('あいう' =~ /あい*いう/).\n";
}

__END__

