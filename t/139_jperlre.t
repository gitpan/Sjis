# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あxう' =~ /(あ.う)/) {
    if ("$1" eq "あxう") {
        print "ok - 1 $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
}

__END__
