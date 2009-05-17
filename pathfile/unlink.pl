# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# unlink
if (unlink('F機能')) {
    print "ok - unlink\n";
    system('echo 1>F機能');
}
else {
    print "not ok - unlink: $!\n";
}

__END__
