# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいいいいう' =~ /(あい{3,4}いう)/) {
    if ("$1" eq "あいいいいう") {
        print "ok - 1 $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre021.pl ('あいいいいう' =~ /あい{3,4}いう/).\n";
}

__END__
