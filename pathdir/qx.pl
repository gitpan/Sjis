# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# qx
system('echo 1 >D�@�\\\qx.txt');
my @qx = split /\n/, `dir /b D�@�\ 2>NUL`;
if (@qx) {
    print "ok - qx\n";
}
else {
    print "not ok - qx: $!\n";
}
system('del D�@�\\\qx.txt');

__END__
