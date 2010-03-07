# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# opendir
if (opendir(DIR,'D‹@”\')) {
    print "ok - opendir $^X $__FILE__\n";
    closedir(DIR);
}
else {
    print "not ok - opendir: $! $^X $__FILE__\n";
}

__END__
