# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

#
# split
#
@X = split(/(.)/, "‚ ‚¢‚¤t‚¦‚¨");
$x = $#X;
if ($x != 11) {
    print "not ok - 1 $^X 04jperlsplit.pl\n";
}
else {
    print "ok - 1 $^X 04jperlsplit.pl\n";
}

__END__
