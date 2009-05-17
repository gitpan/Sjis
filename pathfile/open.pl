# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# open
if (open(FILE,'F‹@”\')) {
    print "ok - open\n";
    close(FILE);
}
else {
    print "not ok - open: $!\n";
}

__END__
