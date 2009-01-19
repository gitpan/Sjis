# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# system
if (system('dir /b F‹@”\ >NUL 2>NUL') == 0) {
    print "ok - system\n";
}
else {
    print "not ok - system: $!\n";
}

__END__
