use Sjis;

if ('あいう' =~ /(あい{0,1}いう)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre025.pl ('あいう' =~ /あい{0,1}いう/).\n";
    }
    else {
        print "not ok - $^X jperlre025.pl ('あいう' =~ /あい{0,1}いう/).\n";
    }
}
else {
    print "not ok - $^X jperlre025.pl ('あいう' =~ /あい{0,1}いう/).\n";
}

__END__

