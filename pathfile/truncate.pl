# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# truncate
if (truncate('F‹@”\',1)) {
    print "ok - truncate\n";
}
else {
    print "not ok - truncate: $!\n";
}

__END__
