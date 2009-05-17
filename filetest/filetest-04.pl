# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 一般的なディレクトリル名と chr(0x5C) で終わるディレクトリ名のファイルテストの結果が一致することの確認

use Sjis;

mkdir('directory',0777);
mkdir('D機能',0777);

opendir(DIR1,'directory');
opendir(DIR2,'D機能');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s 'directory') ne '') == ((-%s 'D機能') ne '')) {
    print "ok - -%s 'directory' == -%s 'D機能'\n";
}
else {
    print "not ok - -%s 'directory' == -%s 'D機能'\n";
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
