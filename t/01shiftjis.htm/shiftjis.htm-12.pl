# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# Bareword found where operator expected
# �u���̌ꂪ���Z�q�������Ăق����ʒu�Ɍ��������v
print "<img alt=\"�Ή��\\" height=115 width=150>";

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print "<img alt=\"�Ή��\\\" height=115 width=150>";

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
