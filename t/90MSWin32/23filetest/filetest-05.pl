# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

print <<'END';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

# ˆø”‚ªÈ—ª‚³‚ê‚½ê‡‚ÌƒeƒXƒg

my $__FILE__ = __FILE__;

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

END

my @operator = qw(r w x o R W X O e z s f d   p S b c t u g k T B M A C);

for my $o (@operator) {

    printf(<<'END',$o,$o,$o,$o,$o,$o);
$_ = 'file';
if ((Esjis::%s_ ne '') == (-%s ne '')) {
    print "ok - Esjis::%s_ == -%s  $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::%s_ == -%s  $^X $__FILE__\n";
}

END

}

print <<'END';
__END__
END

__END__
