# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいえ' =~ /(あ[いう]え)/) {
    if ("$1" eq "あいえ") {
        print "ok - 1 $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
}

__END__
