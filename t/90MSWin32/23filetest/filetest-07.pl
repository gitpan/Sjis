# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# ファイルテストが真になる場合は 1 が返るテスト

my $__FILE__ = __FILE__;

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

END

my @operator = qw(r w o R W O e z f);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o);
if ((Esjis::%s 'file') == 1) {
    $_ = Esjis::%s 'file';
    print "ok - Esjis::%s 'file' ($_) == 1 $^X $__FILE__\n";
}
else {
    $_ = Esjis::%s 'file';
    print "not ok - Esjis::%s 'file' ($_) == 1 $^X $__FILE__\n";
}

END

}

print <<'END';
__END__
END

__END__
