# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいう' =~ /(あい?う)/) {
    if ("$1" eq "あいう") {
        print "ok - 1 $^X jperlre027.pl ('あいう' =~ /あい?う/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre027.pl ('あいう' =~ /あい?う/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre027.pl ('あいう' =~ /あい?う/).\n";
}

__END__
