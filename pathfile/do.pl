# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

system("echo 1 > F�@�\");

# do
if (do 'F�@�\') {
    print "ok - do\n";
}
else {
    print "not ok - do: $!\n";
}

__END__
