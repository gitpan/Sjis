# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 一般的なファイル名と chr(0x5C) で終わるファイル名のファイルテストの結果が一致することの確認

use Sjis;

open(FILE,'>file');
close(FILE);
open(FILE,'>F機能');
close(FILE);

open(FILE1,'file');
open(FILE2,'F機能');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((-%s 'file') ne '') == ((-%s 'F機能') ne '')) {
    print "ok - -%s 'file' == -%s 'F機能'\n";
}
else {
    print "not ok - -%s 'file' == -%s 'F機能'\n";
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
