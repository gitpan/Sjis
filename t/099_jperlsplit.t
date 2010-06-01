# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

#
# split
#
@X = split(/(.)/, "abcde");
if ($#X != 9) {
    print "not ok - 1 $^X 03jperlsplit.pl\n";
}
else {
    print "ok - 1 $^X 03jperlsplit.pl\n";
}

__END__
