# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# chmod
if (chmod(0755,'D‹@”\') == 1) {
    print "ok - chmod\n";
}
else {
    print "not ok - chmod: $!\n";
}

__END__
