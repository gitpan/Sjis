# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# qx
if (qx/type F‹@”\/) {
    print "ok - qx\n";
}
else {
    print "not - ok qx\n";
}

__END__
