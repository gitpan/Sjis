# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# Substitution replacement not terminated
# �u�u������̒u�������񂪏I�����Ȃ��v
eval { s/�\/��/; };
if ($@) {
    print 0;
}
else {
    print 1;
}

__END__

esjis.pl �ŏ��������X�N���v�g�̎��s���ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

1

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
