# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# glob
@glob = glob('./*');
if (grep(/F‹@”\/,@glob)) {
    print "ok - glob $^X $__FILE__\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $! $^X $__FILE__\n";
}

__END__
