# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

system("echo 1 > F機能");

# do
if (do 'F機能') {
    print "ok - do\n";
}
else {
    print "not ok - do: $!\n";
}

__END__
