# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

my $filetest;

$_ = 'F�@�\';

$filetest = -d $_;
if ($filetest) {
    print "not ok - 04filetest.pl (1/6) $^X $__FILE__\n";
}
else {
    print "ok - 04filetest.pl (1/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "ok - 04filetest.pl (2/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (2/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 04filetest.pl (3/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (3/6) $^X $__FILE__\n";
}

$_ = 'D�@�\';

$filetest = -d $_;
if ($filetest) {
    print "ok - 04filetest.pl (4/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (4/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "not ok - 04filetest.pl (5/6) $^X $__FILE__\n";
}
else {
    print "ok - 04filetest.pl (5/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 04filetest.pl (6/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (6/6) $^X $__FILE__\n";
}

__END__

Perl����/Windows�ł̃t�@�C���p�X
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

�t�@�C���֘A�R�}���h�̓���m�F
�u�@�\�v�Ƃ����������ϐ�$_�ɓ���A�t�@�C�����Z�q-d�A-f�A-e���Ń`�F�b�N����ƁA����������undef��Ԃ�

