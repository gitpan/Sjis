# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# qx
system('echo 1 >D機能\\qx.txt');
my @qx = split /\n/, `dir /b D機能 2>NUL`;
if (@qx) {
    print "ok - qx\n";
}
else {
    print "not ok - qx: $!\n";
}
system('del D機能\\qx.txt');

__END__
