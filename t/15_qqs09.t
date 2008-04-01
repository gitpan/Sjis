use strict;

open(SCRIPT,'>15_qqs09.tt') || die "Can't open file: 15_qqs09.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     10 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (0x30 .. 0x39){
    printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),"pack('C',$octet)",pack('C',$octet),"pack('C',$octet)");
# [%s] 1 test
# qqs quote %s
$_ = qqs <<'END';
%s
END
ok($_, %s, "qqs('%s') is %s");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqs09.tt');
unlink('15_qqs09.tt');

__END__
