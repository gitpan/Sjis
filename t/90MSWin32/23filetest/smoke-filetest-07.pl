# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# ファイルテストが真になる場合は 1 が返るテスト

my $__FILE__ = __FILE__;

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if ((Esjis::r 'file') == 1) {
    $_ = Esjis::r 'file';
    print "ok - Esjis::r 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::r 'file';
    print "not ok - Esjis::r 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::w 'file') == 1) {
    $_ = Esjis::w 'file';
    print "ok - Esjis::w 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::w 'file';
    print "not ok - Esjis::w 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::o 'file') == 1) {
    $_ = Esjis::o 'file';
    print "ok - Esjis::o 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::o 'file';
    print "not ok - Esjis::o 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::R 'file') == 1) {
    $_ = Esjis::R 'file';
    print "ok - Esjis::R 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::R 'file';
    print "not ok - Esjis::R 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::W 'file') == 1) {
    $_ = Esjis::W 'file';
    print "ok - Esjis::W 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::W 'file';
    print "not ok - Esjis::W 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::O 'file') == 1) {
    $_ = Esjis::O 'file';
    print "ok - Esjis::O 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::O 'file';
    print "not ok - Esjis::O 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::e 'file') == 1) {
    $_ = Esjis::e 'file';
    print "ok - Esjis::e 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::e 'file';
    print "not ok - Esjis::e 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::z 'file') == 1) {
    $_ = Esjis::z 'file';
    print "ok - Esjis::z 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::z 'file';
    print "not ok - Esjis::z 'file' ($_) == 1 $^X $__FILE__\n";
}

if ((Esjis::f 'file') == 1) {
    $_ = Esjis::f 'file';
    print "ok - Esjis::f 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::f 'file';
    print "not ok - Esjis::f 'file' ($_) == 1 $^X $__FILE__\n";
}

__END__
