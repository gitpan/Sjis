# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

$_ = 'F�@�\';
if (@_ = stat($_)) {
    print "ok - perl 03stat.pl (1/2)\n";
}
else{
    print "not ok - perl 03stat.pl (1/2)\n";
}

$_ = 'D�@�\';
if (@_ = stat($_)) {
    print "not ok - perl 03stat.pl (2/2)\n";
}
else{
    print "ok - perl 03stat.pl (2/2)\n";
}

__END__

Perl����/Windows�ł̃t�@�C���p�X
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

�t�@�C���֘A�R�}���h�̓���m�F
�u�@�\�v�Ƃ����������ϐ�$_�ɓ���Astat($_)�Ƃ��Ă��Ԃ�l���Ȃ� 

