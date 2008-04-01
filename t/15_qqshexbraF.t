use strict;

open(SCRIPT,'>15_qqshexbra.tt') || die "Can't open file: 15_qqshexbra.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    + 1 * 256 * 256 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;

for my $hex1 (0xf){
    for my $hex2 (0x00 .. 0xff){
        for my $hex3 (0x00 .. 0xff){
            printf(<<'SCRIPT',$testno++,$hex1,$hex2,$hex3,$hex1,$hex2,$hex3,$hex1,$hex2,$hex3,$hex1,$hex2,$hex3,$hex1,$hex2,$hex3);
# [%s] 1 test
# qqs quote \x{%01x%02x%02x}
$_ = qqs <<'END';
\x{%01x%02x%02x}
END
ok($_, "\x%01x\x%02x\x%02x", "qqs(\x{%01x%02x%02x}) is \x%01x\x%02x\x%02x");

SCRIPT
        }
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqshexbra.tt');
unlink('15_qqshexbra.tt');

__END__
