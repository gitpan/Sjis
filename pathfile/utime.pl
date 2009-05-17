# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# utime
if (utime(time(),time(),'F‹@”\')) {
    print "ok - utime\n";
}
else {
    print "not ok - utime: $!\n";
}

__END__
