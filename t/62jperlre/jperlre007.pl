use Sjis;

if ('あいう' =~ /(あい*う)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre007.pl ('あいう' =~ /あい*う/).\n";
    }
    else {
        print "not ok - $^X jperlre007.pl ('あいう' =~ /あい*う/).\n";
    }
}
else {
    print "not ok - $^X jperlre007.pl ('あいう' =~ /あい*う/).\n";
}

__END__

