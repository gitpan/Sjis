# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# rename
if (rename('D機能','D2機能')) {
    print "ok - rename $^X $__FILE__\n";
    rename('D2機能','D機能');
}
else {
    print "not ok - rename: $! $^X $__FILE__\n";
}

__END__
