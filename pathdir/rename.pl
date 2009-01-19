# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# rename
if (rename('D機能','D2機能')) {
    print "ok - rename\n";
    rename('D2機能','D機能');
}
else {
    print "not ok - rename: $!\n";
}

__END__
