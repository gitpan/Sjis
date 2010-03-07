# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# utime
if (utime(time(),time(),'D‹@”\')) {
    print "ok - utime $^X $__FILE__\n";
}
else {
    print "not - ok utime: $! $^X $__FILE__\n";
}

__END__
