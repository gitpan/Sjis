use strict;

open(SCRIPT,'>15_qqswo.tt') || die "Can't open file: 15_qqswo.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    (0xfc-0xe0+1+0x9f-0x81+1)*(0xfc-0x80+1+0x7e-0x40+1) # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet1 (0x81 .. 0x9f, 0xe0 .. 0xfc){
    for my $octet2 (0x40 .. 0x7e, 0x80 .. 0xfc){
        printf(<<'SCRIPT',$testno++,"pack('CC',$octet1,$octet2)",pack('CC',$octet1,$octet2),"pack('CC',$octet1,$octet2)",$octet1,$octet2,"pack('CC',$octet1,$octet2)");
# [%s] 1 test
# qqs quote %s
$_ = qqs <<'END';
%s
END
ok($_, %s, "qqs(\\x%02X\\x%02X) is %s");

SCRIPT
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqswo.tt');
unlink('15_qqswo.tt');

__END__
