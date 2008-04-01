use strict;

open(SCRIPT,'>15_qqsoct03.tt') || die "Can't open file: 15_qqsoct03.tt\n";
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
for my $octet (000 .. 0377){
    printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet);
# [%s] 1 test
# qqs quote \%03o
$_ = qqs <<'END';
\%03o
END
ok($_, "\%03o", "qqs(\%03o) is \%03o");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsoct03.tt');
unlink('15_qqsoct03.tt');

__END__
