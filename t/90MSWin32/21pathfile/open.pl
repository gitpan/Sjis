# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# open
if (open(FILE,'F‹@”\')) {
    print "ok - open $^X $__FILE__\n";
    close(FILE);
}
else {
    print "not ok - open: $! $^X $__FILE__\n";
}

__END__
