# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいうえ' =~ /(あい|うえ)/) {
    if ("$1" eq "あい") {
        print "ok - 1 $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre076.pl ('あいうえ' =~ /あい|うえ/).\n";
}

__END__
