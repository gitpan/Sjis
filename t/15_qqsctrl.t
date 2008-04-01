use strict;

open(SCRIPT,'>15_qqsctrl.tt') || die "Can't open file: 15_qqsctrl.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    32 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $c (0x40 .. 0x5f){
    if ($c == 0x5c) {
        printf(<<'SCRIPT',$testno++,$c,$c);
# [%s] 1 test
# qqs quote \c%c
$_ = qqs <<'END';
\c%c
END
ok($_, "\x1c", "qqs(\c\) is \x1c");

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,$c,$c,$c,$c,$c);
# [%s] 1 test
# qqs quote \c%c
$_ = qqs <<'END';
\c%c
END
ok($_, "\c%c", "qqs(\c%c) is \c%c");

SCRIPT
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsctrl.tt');
unlink('15_qqsctrl.tt');

__END__
