# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

# �G���[�ɂ͂Ȃ�Ȃ����Ǖ�����������i�P�j
if ("�\��" eq pack('C4',0x96,0x5c,0x97,0xcd)) {
    print qq<ok - 1 "BORYOKU"\n>;
}
else {
    print qq<not ok - 1 "BORYOKU"\n>;
}

__END__

Sjis.pm �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

if ("�\\��" eq pack('C4',0x96,0x5c,0x97,0xcd)) {

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
