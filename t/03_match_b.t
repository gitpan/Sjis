use strict;
use Test;

my $tests;

BEGIN {
    $tests = 4;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# match [\b]DEF
$_ = "ABC\bDEF";
ok(match(<<'END'), 1, q<'ABC\bDEF': match('[\b]DEF') is 1>);
[\b]DEF
END

# [2] 1 test
# match \bDEF
$_ = "ABCDEF";
ok(match(<<'END'), '', q<'ABCDEF': match('\bDEF') is ''>);
\bDEF
END

# [3] 1 test
# match [\b]DEF
$_ = "ABC DEF";
ok(match(<<'END'), '', q<'ABC DEF': match('[\b]DEF') is ''>);
[\b]DEF
END

# [4] 1 test
# match \bDEF
$_ = "ABC DEF";
ok(match(<<'END'), 1, q<'ABC DEF': match('\bDEF') is 1>);
\bDEF
END

__END__
