# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Esjis::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト(対象はディレクトリ)

use Esjis;

mkdir('directory',0777);

opendir(DIR,'directory');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((Esjis::%s 'directory') ne '') == ((-%s 'directory') ne '')) {
    print "ok - Esjis::%s 'directory' == -%s 'directory'\n";
}
else {
    print "not ok - Esjis::%s 'directory' == -%s 'directory'\n";
}

END

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((Esjis::%s DIR) ne '') == ((-%s DIR) ne '')) {
    print "ok - Esjis::%s DIR == -%s DIR\n";
}
else {
    print "not ok - Esjis::%s DIR == -%s DIR\n";
}

END

}

print <<'END';
__END__
END

__END__
