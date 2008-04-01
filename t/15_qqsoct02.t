use strict;

open(SCRIPT,'>15_qqsoct02.tt') || die "Can't open file: 15_qqsoct02.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    0100 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (00 .. 077){
    printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet);
# [%s] 1 test
# qqs quote \%02o
$_ = qqs <<'END';
\%02o
END
ok($_, "\%02o", "qqs(\%02o) is \%02o");

SCRIPT
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsoct02.tt');
unlink('15_qqsoct02.tt');

__END__
