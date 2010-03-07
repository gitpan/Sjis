# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# glob (1/2)
my @glob = glob('./*');
if (grep(/D機能/,@glob)) {
    print "ok - glob (1/2) $^X $__FILE__\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $! $^X $__FILE__\n";
}

# glob (2/2)
my @glob = glob('./D機能/*');
if (@glob) {
    print "ok - glob (2/2) $^X $__FILE__\n";
}
else {
    print "not ok - glob: ", (map {"($_)"} @glob), ": $! $^X $__FILE__\n";
}

__END__
