# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

# �G���[�ɂ͂Ȃ�Ȃ����Ǖ�����������i�S�j
if ("�����@ARGV" eq pack('C10',0x88,0xf8,0x90,0x94,0x81,0x40,0x41,0x52,0x47,0x56)) {
    print qq<ok - 1 "HIKISU ARGV"\n>;
}
else {
    print qq<not ok - 1 "HIKISU ARGV"\n>;
}

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

if ("�����\@ARGV" eq pack('C10',0x88,0xf8,0x90,0x94,0x81,0x40,0x41,0x52,0x47,0x56)) {

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
