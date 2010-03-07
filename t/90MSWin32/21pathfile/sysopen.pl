# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# sysopen
use Fcntl;
if (sysopen(FILE,'F‹@”\',O_RDONLY)) {
    print "ok - sysopen $^X $__FILE__\n";
    close(FILE);
}
else {
    print "not ok - sysopen: $! $^X $__FILE__\n";
}

__END__
