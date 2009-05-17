# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# glob
@glob = glob('./*');
if (grep(/F‹@”\/,@glob)) {
    print "ok - glob\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $!\n";
}

__END__
