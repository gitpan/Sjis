# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あxyzう' =~ /(あ.*う)/) {
    if ("$1" eq "あxyzう") {
        print "ok - 1 $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
}

__END__
