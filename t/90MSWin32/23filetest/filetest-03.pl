# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# Esjis::X �� -X (Perl�̃t�@�C���e�X�g���Z�q) �̌��ʂ���v���邱�Ƃ̃e�X�g(�Ώۂ̓f�B���N�g��)

my $__FILE__ = __FILE__;

use Esjis;

mkdir('directory',0777);

opendir(DIR,'directory');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((Esjis::%s 'directory') ne '') == ((-%s 'directory') ne '')) {
    print "ok - Esjis::%s 'directory' == -%s 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::%s 'directory' == -%s 'directory' $^X $__FILE__\n";
}

END
}

print <<'END';
__END__
END

__END__
