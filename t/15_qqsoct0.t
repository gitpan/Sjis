use strict;

open(SCRIPT,'>15_qqsoct0.tt') || die "Can't open file: 15_qqsoct0.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    1 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (0){
    printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet);
# [%s] 1 test
# qqs quote \%01o
$_ = qqs <<'END';
\%01o
END
ok($_, "\%01o", "qqs(\%01o) is \%01o");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsoct0.tt');
unlink('15_qqsoct0.tt');

__END__
