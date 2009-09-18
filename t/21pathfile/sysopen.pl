# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# sysopen
use Fcntl;
if (sysopen(FILE,'F‹@”\',O_RDONLY)) {
    print "ok - sysopen\n";
    close(FILE);
}
else {
    print "not ok - sysopen: $!\n";
}

__END__
