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

# [1] 1 test
# qqs quote $a
use vars qw($a);
$a = 'abc';
$_ = qqs <<'END';
$a
END
ok($_, "$a", "qqs(\$a) is \$a");

# [2] 1 test
# qqs quote ${a}
use vars qw($a);
$a = 'def';
$_ = qqs <<'END';
${a}
END
ok($_, "$a", "qqs(\$a) is \$a");

# [3] 1 test
# qqs quote $a[0]
use vars qw(@a);
@a = ('ghi');
$_ = qqs <<'END';
$a[0]
END
ok($_, "$a[0]", "qqs(\$a[0]) is \$a[0]");

# [4] 1 test
# qqs quote @a
use vars qw(@a);
@a = ('jkl');
$_ = qqs <<'END';
@a
END
ok($_, "@a", "qqs(\@a) is \@a");

# [5] 1 test
# qqs quote @{a}
use vars qw(@a);
@a = ('mno');
$_ = qqs <<'END';
@{a}
END
ok($_, "@{a}", "qqs(\@{a}) is \@{a}");

# [6] 1 test
# qqs quote @a[0..2]
use vars qw(@a);
@a = ('pqr','stu','vwx');
$_ = qqs <<'END';
@a[0,1,2]
END
ok($_, "@a[0,1,2]", "qqs(\@a[0,1,2]) is \@a[0,1,2]");

# [7] 1 test
# qqs quote @a[0..2]
use vars qw(@a);
@a = ('pqr','stu','vwx');
$_ = qqs <<'END';
@a[0..2]
END
ok($_, "@a[0..2]", "qqs(\@a[0..2]) is \@a[0..2]");

# [8] 1 test
# qqs quote $a{'ABC'}
use vars qw(%a);
%a = ('ABC' => '123');
$_ = qqs <<'END';
$a{'ABC'}
END
ok($_, $a{'ABC'}, "qqs(\$a{'ABC'}) is \$a{'ABC'}");

# [9] 1 test
# qqs quote $a{"ABC"}
use vars qw(%a);
%a = ('ABC' => '123');
$_ = qqs <<'END';
$a{"ABC"}
END
ok($_, $a{"ABC"}, qq{qqs(\$a{"ABC"}) is \$a{"ABC"}});

# [10] 1 test
# qqs quote $a{"ABC","DEF","GHI"}
use vars qw(%a);
%a = ('ABC' => '123', 'DEF' => '456', 'GHI' => '789');
$_ = qqs <<'END';
@a{"ABC","DEF","GHI"}
END
ok($_, qq{@a{"ABC","DEF","GHI"}}, qq{qqs(\@a{"ABC","DEF","GHI"}) is \@a{"ABC","DEF","GHI"}});

__END__
