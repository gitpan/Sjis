# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あえう' =~ /(あ[^]い]う)/) {
    if ("$1" eq "あえう") {
        print "ok - 1 $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre058.pl ('あえう' =~ /あ[^]い]う/).\n";
}

__END__
