# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

my @file = glob('./*');
if (grep(/F�@�\/, @file)) {
    if (grep(/D�@�\/, @file)) {
        print "ok - 01glob.pl\n";
    }
    else {
        print "not ok - 01glob.pl\n";
    }
}
else {
    print "not ok - 01glob.pl\n";
}

__END__

Perl����/Windows�ł̃t�@�C���p�X
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

�t�@�C���֘A�R�}���h�̓���m�F
�u�@�\�v������f�B���N�g���ŁAglob('./*')�����Ă��A�u�@�\�v���Ԃ�l�Ɋ܂܂�Ȃ� 
