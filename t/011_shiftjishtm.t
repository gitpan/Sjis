# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

# Can't find string terminator '"' anywhere before EOF
# �u�I�[���� '"'���t�@�C���̏I�� EOF �܂łɌ�����Ȃ������v
if (qq{"���{��"} eq pack('C8',0x22,0x93,0xfa,0x96,0x7b,0x8c,0xea,0x22)) {
    print qq<ok - 1 qq{"NIHONGO"}\n>;
}
else {
    print qq<not ok - 1 qq{"NIHONGO"}\n>;
}

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

if (qq{"���\{��"} eq pack('C8',0x22,0x93,0xfa,0x96,0x7b,0x8c,0xea,0x22)) {

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
