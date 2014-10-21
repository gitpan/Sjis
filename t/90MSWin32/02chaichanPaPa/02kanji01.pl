# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    if ($fileName =~ /\Q�\�[�X\E/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

���Ƃ��΁A./hoge�z���Ɂw�e�X�g�\�[�X.txt�x�Ƃ����t�@�C�����������Ƃ��܂��B
�w[�x�𕁒ʂ̕����������邽�߂ɁA�w�\�[�X�x��\Q��\E�ň͂�ł݂܂��B

�����̂Q�F�R�[�h��shiftjis�A������shiftjis�A�W�����o�͂�shiftjis

���s����
C:\test>perl kanji01.pl
Unmatch
./hoge/�e�X�g�\�[�X.txt

�������A��L�ł̓}�b�`���܂���B
�Ȃ����Ƃ����ƁA /\Q�\�[�X\E/�́A\Q����Ɂw�\�[�X�x�����񂪕]�������̂ŁA
��{�I�Ɂw[�x���G�X�P�[�v�����ɉ߂��܂���B

8/2(�y) ��[Perl�m�[�g] �V�t�gJIS�����̃t�@�C�����Ƀ}�b�`���Ă݂�
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
