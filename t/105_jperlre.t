# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいx' =~ /(あいう)/) {
    print "not ok - 1 $^X jperlre004.pl not ('あいx' =~ /あいう/).\n";
}
else {
    print "ok - 1 $^X jperlre004.pl not ('あいx' =~ /あいう/).\n";
}

__END__
