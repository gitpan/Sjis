# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

# �G���[�ɂ͂Ȃ�Ȃ����Ǖ�����������i�T�j
if (lc('�A�C�E�G�I') eq '�A�C�E�G�I') {
    print "ok - 1 lc('�A�C�E�G�I') eq '�A�C�E�G�I'\n";
}
else {
    print "not ok - 1 lc('�A�C�E�G�I') eq '�A�C�E�G�I'\n";
}

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

if (Esjis::lc('�A�C�E�G�I') eq '�A�C�E�G�I') {

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
