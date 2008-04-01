use strict;

open(SCRIPT,'>03_matchhexbra.tt') || die "Can't open file: 03_matchhexbra.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

       16             # [1]
    + 256             # [2]
    +  16 * 256       # [3]
    + 256 * 256       # [4]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;

for my $hex (0x0 .. 0xf){
    printf(<<'SCRIPT',$testno++,$hex,$hex,$hex,$hex,$hex);
# [%s] 1 test
# match \x{%01x}
$_ = qqs <<'END';
\x{%01x}
END
ok(match(<<'END'), 1, "qqs(\x{%01x}) is \x%01x");
\x{%01x}
END

SCRIPT
}

for my $hex (0x00 .. 0xff){
    printf(<<'SCRIPT',$testno++,$hex,$hex,$hex,$hex,$hex);
# [%s] 1 test
# match \x{%02x}
$_ = qqs <<'END';
\x{%02x}
END
eval {
    ok(match(<<'END'), 1, "qqs(\x{%02x}) is \x%02x");
\x{%02x}
END
};

SCRIPT
}

for my $hex1 (0x0 .. 0x0f){
    for my $hex2 (0x00 .. 0xff){
        printf(<<'SCRIPT',$testno++,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2);
# [%s] 1 test
# match \x{%01x%02x}
$_ = qqs <<'END';
\x{%01x%02x}
END
ok(match(<<'END'), 1, "qqs(\x{%01x%02x}) is \x%01x\x%02x");
\x{%01x%02x}
END

SCRIPT
    }
}

for my $hex1 (0x00 .. 0xff){
    for my $hex2 (0x00 .. 0xff){
        printf(<<'SCRIPT',$testno++,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2,$hex1,$hex2);
# [%s] 1 test
# match \x{%02x%02x}
$_ = qqs <<'END';
\x{%02x%02x}
END
ok(match(<<'END'), 1, "qqs(\x{%02x%02x}) is \x%02x\x%02x");
\x{%02x%02x}
END

SCRIPT
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 03_matchhexbra.tt');
unlink('03_matchhexbra.tt');

__END__

