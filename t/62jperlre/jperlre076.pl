use Sjis;

if ('あいうえ' =~ /(あい|うえ)/) {
    if ("$1" eq "あい") {
        print "ok - $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
    }
    else {
        print "not ok - $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
    }
}
else {
    print "not ok - $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
}

__END__

