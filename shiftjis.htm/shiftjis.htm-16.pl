# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# �}�b�`���Ȃ��͂��Ȃ̂Ƀ}�b�`����i�Q�j
if ("�Z��" =~ /Z/) {
    print 1;
}
else {
    print 0;
}

__END__

esjis.pl �ŏ��������X�N���v�g�̎��s���ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

0

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
