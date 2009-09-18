# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Esjis::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((Esjis::%s 'file') ne '') == ((-%s 'file') ne '')) {
    print "ok - Esjis::%s 'file' == -%s 'file'\n";
}
else {
    print "not ok - Esjis::%s 'file' == -%s 'file'\n";
}

END

    printf(<<'END',$o,$o,$o,$o,$o,$o);
if (((Esjis::%s FILE) ne '') == ((-%s FILE) ne '')) {
    print "ok - Esjis::%s FILE == -%s FILE\n";
}
else {
    print "not ok - Esjis::%s FILE == -%s FILE\n";
}

END

}

print <<'END';
__END__
END

__END__
