# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# ��ʓI�ȃt�@�C������ chr(0x5C) �ŏI���t�@�C�����̃t�@�C���e�X�g�̌��ʂ���v���邱�Ƃ̊m�F

use Sjis;

open(FILE,'>file');
close(FILE);
open(FILE,'>F�@�\');
close(FILE);

open(FILE1,'file');
open(FILE2,'F�@�\');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s 'file') ne '') == ((-%s 'F�@�\') ne '')) {
    print "ok - -%s 'file' == -%s 'F�@�\'\n";
}
else {
    print "not ok - -%s 'file' == -%s 'F�@�\'\n";
}

END

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s FILE1) ne '') == ((-%s FILE2) ne '')) {
    print "ok - -%s FILE1 == -%s FILE2\n";
}
else {
    print "not ok - -%s FILE1 == -%s FILE2\n";
}

END

}

print <<'END';
__END__
END

__END__
