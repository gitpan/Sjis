# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# chmod
if (chmod(0755,'D‹@”\') == 1) {
    print "ok - chmod $^X $__FILE__\n";
}
else {
    print "not ok - chmod: $! $^X $__FILE__\n";
}

__END__
