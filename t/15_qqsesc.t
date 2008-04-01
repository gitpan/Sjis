use strict;

open(SCRIPT,'>15_qqsesc.tt') || die "Can't open file: 15_qqsesc.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

    8 # [1]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \0
$_ = qqs <<'END';
\0
END
ok($_, "\0", "qqs('\\0') is \\0");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \n
$_ = qqs <<'END';
\n
END
ok($_, "\n", "qqs('\\n') is \\n");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \r
$_ = qqs <<'END';
\r
END
ok($_, "\r", "qqs('\\r') is \\r");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \t
$_ = qqs <<'END';
\t
END
ok($_, "\t", "qqs('\\t') is \\t");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \f
$_ = qqs <<'END';
\f
END
ok($_, "\f", "qqs('\\f') is \\f");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \b
$_ = qqs <<'END';
\b
END
ok($_, "\b", "qqs('\\b') is \\b");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \a
$_ = qqs <<'END';
\a
END
ok($_, "\a", "qqs('\\a') is \\a");

SCRIPT

printf(<<'SCRIPT',$testno++);
# [%s] 1 test
# qqs quote \e
$_ = qqs <<'END';
\e
END
ok($_, "\e", "qqs('\\e') is \\e");

SCRIPT

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 15_qqsesc.tt');
unlink('15_qqsesc.tt');

__END__
