# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

local $^W = 1;

unless (@ARGV) {
    die <<'END';
���s���@:

jperl55.bat grepdir.pl aaa dt
jperl55.bat grepdir.pl �\  dt
jperl.exe   grepdir.pl aaa dt
jperl.exe   grepdir.pl �\  dt
END
}

&grepdir(@ARGV);

exit 0;

sub grepdir ($$) {
    my($pat,$dir) = @_;
    my($node);

# �C���ӏ�1
#   opendir(D,$dir);
#   my @nodes = grep (!/^\./, readdir(D));
#   closedir(D);
    my @nodes = split(/\n/,`dir /b $dir 2>NUL`);

    # --------------------------------------------------
    foreach $node (@nodes) {

# �C���ӏ�2
#       my $path="$dir/$node";
        my $path="$dir\\$node";

        print "!!$path!!\n";

        if ( -f $path ) {
            grepfile($pat,$path);
        }
        elsif( -d $path) {
            &grepdir($pat,$path);
        }
        else {
            print STDERR "skip:$path\n";
        }
    }
}

sub grepfile ($$) {
    my($pat,$file) = @_;
    open(IN,$file) or die "Error:open($file):$!\n";
    while (<IN>) {
        chomp;

# �C���ӏ�3
#       print "$file:$_\n" if (/$pat/);
        print "$file:$_\n" if (/\Q$pat\E/);
    }
}

__END__

Windows��Perl 5.8/5.10���g����������Ȃ�
http://www.aritia.org/hizumi/perl/perlwin.html

�́u�����ŏЉ���X�N���v�g�̃T���v���v�� grepdir.pl �𗘗p���Ă��܂��B

��: ���K�\�����w�肵�āC�w�肵���f�B���N�g���z���̃t�@�C��������o���R�[�h�������Ă�B

�R�}���h�`��: jperl grepdir.pl {�p�^�[��} {�f�B���N�g��}

���̂悤�ȃe�X�g����p�ӂ���B

C:\TEMP\TP> tree /F dt
�t�H���_ �p�X�̈ꗗ: �{�����[�� vvvvv_vvvvvvvvv
�{�����[�� �V���A���ԍ��� vvvv-ssss �ł�
C:\TEMP\TP\DT
����alphabet
��      alpha.txt
��      sjis.txt
��
�������{��
       alpha.txt
       sjis.txt

����� jperl55.bat �ɂĎ��s������ƁC���̂悤�ɂȂ�B

C:\TEMP\TP\DT>jperl55.bat grepdir.pl aaa dt
!!dt/alphabet!!
!!dt/alphabet/alpha.txt!!
dt/alphabet/alpha.txt:aaa
!!dt/alphabet/sjis.txt!!
dt/alphabet/sjis.txt:aaa
!!dt/���{��!!
!!dt/���{��/alpha.txt!!
dt/���{��/alpha.txt:aaa
!!dt/���{��/sjis.txt!!
dt/���{��/sjis.txt:aaa

C:\TEMP\TP\DT>jperl55.bat grepdir.pl �\ dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:�\
!!dt\���{��!!
!!dt\���{��\alpha.txt!!
!!dt\���{��\sjis.txt!!
dt\���{��\sjis.txt:�\

�Q�l�܂ł� jperl.exe �ɂĎ��s������ƁC���̂悤�ɂȂ�B

C:\TEMP\TP\DT>jperl.exe grepdir.pl aaa dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
dt\alphabet\alpha.txt:aaa
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:aaa
!!dt\���{��!!
!!dt\���{��\alpha.txt!!
dt\���{��\alpha.txt:aaa
!!dt\���{��\sjis.txt!!
dt\���{��\sjis.txt:aaa

C:\TEMP\TP\DT>jperl.exe grepdir.pl �\ dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:�\
!!dt\���{��!!
!!dt\���{��\alpha.txt!!
!!dt\���{��\sjis.txt!!
dt\���{��\sjis.txt:�\

�����Ȃ���΂Ȃ�Ȃ��Ƃ���́C�ȉ��̂悤�ȂƂ���ɂȂ�B

�C���ӏ�1
  MS-DOS, Microsoft Windows �̓��{��ŏ�� opendir, readdir, closedir ��
  �g�p����̂͂��Ƃ��Ɩ�肪����̂ňȉ��̂悤�� dir �R�}���h���g���Ƃ悢�B

    ----------------------------------------------
    opendir(D,$dir);
    my @nodes = grep (!/^\./, readdir(D));
    closedir(D);
    ----------------------------------------------
                �� ��������
    ----------------------------------------------
    my @nodes = split(/\n/,`dir /b $dir 2>NUL`);
    ----------------------------------------------

�C���ӏ�2
  Windows �ł̃f�B���N�g���̋�؂�� \ �Ȃ̂� \ ���g����������B

    ----------------------------------------------
    my $path="$dir/$node";
    ----------------------------------------------
                �� ��������
    ----------------------------------------------
    my $path="$dir\\$node";
    ----------------------------------------------

�C���ӏ�3
  ���K�\�����ɕϐ����L�q���A�ϐ��Ɋi�[����Ă�����e���̂��̂Ƀ}�b�`
  ���������̂ł���� \Q ... \E �ň͂ޕK�v������B
  (�����Ƃ��C���ӏ�2�� / �� \ �ɕύX���Ă��܂������߂����B)

    ----------------------------------------------
    print "$file:$_\n" if (/$pat/);
    ----------------------------------------------
                �� ��������
    ----------------------------------------------
    print "$file:$_\n" if (/\Q$pat\E/);
    ----------------------------------------------

�ȏ�
