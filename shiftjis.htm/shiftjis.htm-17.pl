# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# �}�b�`����͂��Ȃ̂Ƀ}�b�`���Ȃ��i�P�j
if ("�^�]�Ƌ�" =~ /�^�]/) {
    print 1;
}
else {
    print 0;
}

__END__

Sjis.pm �ŏ��������X�N���v�g�̎��s���ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

1

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
