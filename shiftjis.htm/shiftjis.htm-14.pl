# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# Unrecognized character \x82
# �u�F������Ȃ����� \x82�v
print q{�}�b�`};

__END__

esjis.pl �̏������ʂ��ȉ��ɂȂ邱�Ƃ����҂��Ă���

print q{�\}�b�`};

Shift-JIS�e�L�X�g�𐳂�������
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
