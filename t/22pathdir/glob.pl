# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# glob (1/2)
my @glob = glob('./*');
if (grep(/D機能/,@glob)) {
    print "ok - glob (1/2)\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $!\n";
}

# glob (2/2)
my @glob = glob('./D機能/*');
if (@glob) {
    print "ok - glob (2/2)\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $!\n";
}

__END__
