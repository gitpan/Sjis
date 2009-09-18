# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

system('echo 1 > F機能');
system('del file 2>NUL');

# rename (1/3)
if (rename('F機能','file')) {
    print "ok - rename (1/3)\n";
}
else {
    print "not ok - rename: $!\n";
}

# rename (2/3)
if (rename('file','F機能')) {
    print "ok - rename (2/3)\n";
}
else {
    print "not ok - rename: $!\n";
}

# rename (3/3)
if (rename('F機能','F2機能')) {
    print "ok - rename (3/3)\n";
    system('del F2機能 2>NUL');
}
else {
    print "not ok - rename: $!\n";
}

__END__
