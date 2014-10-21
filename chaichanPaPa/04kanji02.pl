# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    my $wk = '�\�[�X';
    if ($fileName =~ /\Q$wk\E/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

���Ƃ��΁A./hoge�z���Ɂw�e�X�g�\�[�X.txt�x�Ƃ����t�@�C�����������Ƃ��܂��B
�ϐ��W�J���Ȃ��悤�ɃV���O���N�H�[�g�wmy $wk = '�\�[�X';�x�ɂ��Ă݂܂��B

�����̂S�F�R�[�h��shiftjis�A������shiftjis�A�W�����o�͂�shiftjis

���s����
C:\test>perl kanji02.pl
Match
./hoge/�e�X�g�\�[�X.txt
���x�́A��肭�s���܂����B

8/2(�y) ��[Perl�m�[�g] �V�t�gJIS�����̃t�@�C�����Ƀ}�b�`���Ă݂�
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
