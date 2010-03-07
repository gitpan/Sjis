# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 引数に _ が指定された場合のテスト

my $__FILE__ = __FILE__;

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    if ($o =~ /\A [TB] \z/oxms) {
    }
    elsif ($o =~ /\A [sMAC] \z/oxms) {
        printf(<<'END',$o,$o,$o,$o,$o,$o,$o,$o);
$_ = -%s 'file';
if (Esjis::%s(_) == $_) {
    print "ok - Esjis::%s _ (@{[Esjis::%s _]}) == -%s 'file' ($_) $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::%s _ (@{[Esjis::%s _]}) == -%s 'file' ($_) $^X $__FILE__\n";
}
END
    }
    else {
        printf(<<'END',$o,$o,$o,$o,$o,$o,$o,$o,$o,$o,$o);
if (-%s ('file')) {
    if (Esjis::%s(_)) {
        print "ok - Esjis::%s _ == -%s _ $^X $__FILE__\n";
    }
    else {
        print "not ok - Esjis::%s _ == -%s _ $^X $__FILE__\n";
    }
}
else {
    if (Esjis::%s(_)) {
        print "not ok - Esjis::%s _ == -%s _ $^X $__FILE__\n";
    }
    else {
        print "ok - Esjis::%s _ == -%s _ $^X $__FILE__\n";
    }
}

END
    }
}

print <<'END';
__END__
END

__END__
