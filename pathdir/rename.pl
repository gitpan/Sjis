# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# rename
if (rename('D�@�\','D2�@�\')) {
    print "ok - rename\n";
    rename('D2�@�\','D�@�\');
}
else {
    print "not ok - rename: $!\n";
}

__END__
