# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# mkdir
if (mkdir('D2�@�\',0777)) {
    print "ok - mkdir\n";
    system('rmdir D2�@�\ 2>NUL');
}
else {
    print "not ok - mkdir: $!\n";
}

__END__
