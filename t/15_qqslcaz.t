use strict;

open(SCRIPT,'>15_qqslcaz.tt') || die "Can't open file: 15_qqslcaz.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     26+26 # [1]
    +26+26 # [2]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (0x41 .. 0x5a, 0x61 .. 0x7a){
    printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),lc pack('C',$octet),pack('C',$octet),lc pack('C',$octet));
# [%s] 1 test
# qqs quote \L%s\E
$_ = qqs <<'END';
\L%s\E
END
ok($_, "%s", "qqs('\L%s\E') is %s");

SCRIPT
}

for my $octet (0x41 .. 0x5a, 0x61 .. 0x7a){
    printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),lc pack('C',$octet),pack('C',$octet),lc pack('C',$octet));
# [%s] 1 test
# qqs quote \L%s
$_ = qqs <<'END';
\L%s
END
ok($_, "%s", "qqs('\L%s') is %s");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqslcaz.tt');
unlink('15_qqslcaz.tt');

__END__
