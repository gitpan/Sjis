# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# Can't find string terminator '"' anywhere before EOF
# �u�I�[���� '"'���t�@�C���̏I�� EOF �܂łɌ�����Ȃ������v
print qq{"���{��"};

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print qq{"���\{��"};

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
