# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# ��ʓI�ȃf�B���N�g�������� chr(0x5C) �ŏI���f�B���N�g�����̃t�@�C���e�X�g�̌��ʂ���v���邱�Ƃ̊m�F

use Sjis;

mkdir('directory',0777);
mkdir('D�@�\',0777);

opendir(DIR1,'directory');
opendir(DIR2,'D�@�\');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s 'directory') ne '') == ((-%s 'D�@�\') ne '')) {
    print "ok - -%s 'directory' == -%s 'D�@�\'\n";
}
else {
    print "not ok - -%s 'directory' == -%s 'D�@�\'\n";
}

END

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s DIR1) ne '') == ((-%s DIR2) ne '')) {
    print "ok - -%s DIR1 == -%s DIR2\n";
}
else {
    print "not ok - -%s DIR1 == -%s DIR2\n";
}

END

}

print <<'END';
__END__
END

__END__
