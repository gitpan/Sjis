# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# chown
if (chown(-1,-1,'D‹@”\')) {
    print "ok - chown\n";
}
else {
    print "not ok - chown: $!\n";
}

__END__
