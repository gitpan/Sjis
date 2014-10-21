#!/usr/bin/perl
use strict;
# use warnings;

while (my $fileName = glob("./hoge/*")) {
    my $wk = "�\�[�X";
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
��x�w�\�[�X�x�������ϐ��Ɋi�[���Ă݂܂��B

�����̂R�F�R�[�h��shiftjis�A������shiftjis�A�W�����o�͂�shiftjis

���s����
C:\test>perl kanji02x.pl
Unmatch
./hoge/�e�X�g�\�[�X.txt

�������A��L�ł̓}�b�`���܂���B
����́A�wmy $wk = "�\�[�X";�x�Łw�\�x�̑�Q�o�C�g���G�X�P�[�v�����w\�x��
�R�[�h�ɂȂ��Ă��邩��ł��B
�����āA�w�\�x�̑�P�o�C�g�Ɓw�[�x�̑�P�o�C�g�������t���Ă��܂��̂ł��B

8/2(�y) ��[Perl�m�[�g] �V�t�gJIS�����̃t�@�C�����Ƀ}�b�`���Ă݂�
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
