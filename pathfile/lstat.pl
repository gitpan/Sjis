# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# lstat
if (lstat('F‹@”\')) {
    print "ok - lstat\n";
}
else {
    print "not ok - lstat: $!\n";
}

__END__
