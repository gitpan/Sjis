# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいいう' =~ /(あい+いう)/) {
    if ("$1" eq "あいいう") {
        print "ok - 1 $^X jperlre014.pl ('あいいう' =~ /あい+いう/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre014.pl ('あいいう' =~ /あい+いう/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre014.pl ('あいいう' =~ /あい+いう/).\n";
}

__END__
