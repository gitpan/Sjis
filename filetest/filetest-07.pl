# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# �t�@�C���e�X�g���^�ɂȂ�ꍇ�� 1 ���Ԃ�e�X�g

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
    print "ok - Esjis::%s 'file' ($_) == 1\n";
}
else {
    $_ = Esjis::%s 'file';
    print "not ok - Esjis::%s 'file' ($_) == 1\n";
}

END

}

print <<'END';
__END__
END

__END__
