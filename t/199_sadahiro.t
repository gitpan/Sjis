# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = __FILE__;

# ��ǂ݌��� (�Ⴆ�� C<(?<=[A-Z])>) �����O�̓�o�C�g�����̑��o�C�g��
# ����ă}�b�`���邱�Ƃɂ͑Ώ�����Ă��܂���B
# �Ⴆ�΁A C<match("�A�C�E", '(?<=[A-Z])(\p{Kana})')> �� C<('�C')>
# ��Ԃ��܂����A���������ł��B

if ('�A�C�E' =~ /(?<=[A-Z])([�A�C�E])/) {
    print "ok - 1 # SKIP $^X $__FILE__ ('�A�C�E' =~ /(?<=[A-Z])([�A�C�E])/)($1)\n";
}
else {
    print "ok - 1 $^X $__FILE__ ('�A�C�E' =~ /(?<=[A-Z])([�A�C�E])/)($1)\n";
}

__END__

http://search.cpan.org/dist/ShiftJIS-Regexp/