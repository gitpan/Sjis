use Sjis;

if ('あいう' =~ /(あい|うえ)/) {
    if ("$1" eq "あい") {
        print "ok - $^X jperlre075.pl ('あいう' =~ /あい|うえ/).\n";
    }
    else {
        print "not ok - $^X jperlre075.pl ('あいう' =~ /あい|うえ/).\n";
    }
}
else {
    print "not ok - $^X jperlre075.pl ('あいう' =~ /あい|うえ/).\n";
}

__END__

