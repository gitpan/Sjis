# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# rename
if (rename('D�@�\','D2�@�\')) {
    print "ok - rename $^X $__FILE__\n";
    rename('D2�@�\','D�@�\');
}
else {
    print "not ok - rename: $! $^X $__FILE__\n";
}

__END__
