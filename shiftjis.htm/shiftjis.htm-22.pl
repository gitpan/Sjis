# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# �G���[�ɂ͂Ȃ�Ȃ����Ǖ�����������i�T�j
print lc('�A�C�E�G�I');

__END__

esjis.pl �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print Esjis::lc('�A�C�E�G�I');

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
