# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

# In string, @dog now must be written as \@dog (Perl 5.6.0�܂�)
# �u������̒��ł́A@dog�͍���\@dog�Ə����Ȃ���΂Ȃ�Ȃ��v
print "�ԁ@\flower";

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print "�ԁ\@\flower";

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
