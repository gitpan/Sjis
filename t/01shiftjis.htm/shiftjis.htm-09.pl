# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# Possible unintended interpolation of @dog in string (Perl 5.6.1�ȍ~)
# ������̒��ŁA@dog���\�������ɓW�J�����
print "���@dog";

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print "���\@dog";

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
