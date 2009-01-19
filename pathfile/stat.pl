# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# stat
if (stat('F‹@”\')) {
    print "ok - stat\n";
}
else {
    print "not ok - stat: $!\n";
}

__END__
