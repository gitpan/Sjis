use strict;

open(SCRIPT,'>15_qqsqmeta.tt') || die "Can't open file: 15_qqsqmeta.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     26+26+1+10         # [1]
    +256-(26+26+1+10)-7 # [2]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (0x30 .. 0x39, 0x41 .. 0x5a, 0x5f, 0x61 .. 0x7a){
    printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),pack('C',$octet),pack('C',$octet),pack('C',$octet),$octet);
# [%s] 1 test
# qqs quote \Q%s
$_ = qqs <<'END';
\Q%s
END
ok($_, "%s", "qqs('\Q%s') is %s %02x");

SCRIPT
}

for my $octet (0x00 .. 0x2f, 0x3a .. 0x40, 0x5b .. 0x5e, 0x60, 0x7b .. 0xff){
    next if $octet == 0x0d; # CR
    next if $octet == 0x1a; # EOF
    next if $octet == 0x22; # "
    next if $octet == 0x23; # #
    next if $octet == 0x24; # $
    next if $octet == 0x40; # @
    next if $octet == 0x5c; # \

    printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),pack('C',$octet),pack('C',$octet),pack('C',$octet),$octet);
# [%s] 1 test
# qqs quote \Q%s
$_ = qqs <<'END';
\Q%s
END
ok($_, "\\%s", "qqs('\Q\%s') is \%s %02x");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsqmeta.tt');
unlink('15_qqsqmeta.tt');

__END__
