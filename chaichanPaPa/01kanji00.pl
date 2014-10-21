# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    if ($fileName =~ /�\�[�X/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

���Ƃ��΁A./hoge�z���Ɂw�e�X�g�\�[�X.txt�x�Ƃ����t�@�C�����������Ƃ��܂��B

�����̂P�F�R�[�h��shiftjis�A������shiftjis�A�W�����o�͂�shiftjis

���s����
C:\test>perl kanji00.pl
Unmatched [ in regex; marked by <-- HERE in m/��[ <-- HERE �X/ at kanji00.pl line 6.

�������A��L�ł̓}�b�`���܂���B
�Ƃ������A���K�\���G���[�ɂȂ�܂��B
����́A�w�\�[�X�x�́w�[�x�̑�Q�o�C�g���w[�x�̃R�[�h�ɂȂ��Ă��邩��ł��B
�����āA���́w]�x���Ȃ����߂ɐ��K�\���G���[�ɂȂ�̂ł��B

8/2(�y) ��[Perl�m�[�g] �V�t�gJIS�����̃t�@�C�����Ƀ}�b�`���Ă݂�
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
