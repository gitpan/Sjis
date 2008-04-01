use strict;

open(SCRIPT,'>15_qqshex02.tt') || die "Can't open file: 15_qqshex02.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    256 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $hex (0x00 .. 0xff){
    printf(<<'SCRIPT',$testno++,$hex,$hex,$hex,$hex,$hex);
# [%s] 1 test
# qqs quote \x%02x
$_ = qqs <<'END';
\x%02x
END
ok($_, "\x%02x", "qqs(\x%02x) is \x%02x");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqshex02.tt');
unlink('15_qqshex02.tt');

__END__
