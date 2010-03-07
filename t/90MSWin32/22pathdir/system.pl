# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# system
if (system('dir /b D‹@”\ >NUL 2>NUL') == 0) {
    print "ok - system $^X $__FILE__\n";
}
else {
    print "not ok - system: $! $^X $__FILE__\n";
}

__END__
