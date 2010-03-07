# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# chown
if (chown(-1,-1,'D‹@”\')) {
    print "ok - chown $^X $__FILE__\n";
}
else {
    print "not ok - chown: $! $^X $__FILE__\n";
}

__END__
