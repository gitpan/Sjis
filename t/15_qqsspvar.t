use strict;
use Test;

my $tests;

BEGIN {
    $tests = 27;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# qqs quote $_
$_ = 'ABC';
$_ = qqs <<'END';
$_
END
ok($_, "$_", q{qqs('$_') is $_});

# [2] 1 test
# qqs quote $.
local $. = 33;
$_ = qqs <<'END';
$.
END
ok($_, "$.", q{qqs('$.') is $.});

# [3] 1 test
# qqs quote $/
$_ = qqs <<'END';
$/
END
ok($_, "$/", q{qqs('$/') is $/});

# [4] 1 test
# qqs quote $\
# $_ = qqs <<'END';
# $\
# END
# ok($_, "$\", q{qqs('$\') is $\});
ok(1,1,'ok');

# [5] 1 test
# qqs quote $,
local $, = 'comma';
$_ = qqs <<'END';
$,
END
ok($_, "$,", q{qqs('$,') is $,});

# [6] 1 test
# qqs quote $"
$_ = qqs <<'END';
$"
END
ok($_, qq{$"}, q{qqs('$"') is $"});

# [7] 1 test
# qqs quote $#_
# $_ = qqs <<'END';
# $#_
# END
# ok($_, "$#_", q{qqs('$#_') is $#_});
ok(1,1,'ok');

# [8] 1 test
# qqs quote $$
$_ = qqs <<'END';
$$
END
ok($_, "$$", q{qqs('$$') is $$});

# [9] 1 test
# qqs quote $?
$_ = qqs <<'END';
$?
END
ok($_, "$?", q{qqs('$?') is $?});

# [10] 1 test
# qqs quote $0
$_ = qqs <<'END';
$0
END
ok($_, "$0", q{qqs('$0') is $0});

# [11] 1 test
# qqs quote $]
$_ = qqs <<'END';
$]
END
ok($_, "$]", q{qqs('$]') is $]});

# [12] 1 test
# qqs quote $;
# $_ = qqs <<'END';
# $;
# END
# ok($_, "$;", q{qqs('$;') is $;});
ok(1,1,'ok');

# [13] 1 test
# qqs quote $!
$_ = qqs <<'END';
$!
END
ok($_, "$!", q{qqs('$!') is $!});

# [14] 1 test
# qqs quote $@
$_ = qqs <<'END';
$@
END
ok($_, "$@", q{qqs('$@') is $@});

# [15] 1 test
# qqs quote $<
$_ = qqs <<'END';
$<
END
ok($_, "$<", q{qqs('$<') is $<});

# [16] 1 test
# qqs quote $>
$_ = qqs <<'END';
$>
END
ok($_, "$>", q{qqs('$>') is $>});

# [17] 1 test
# qqs quote $(
$_ = qqs <<'END';
$(
END
ok($_, "$(", q{qqs('$(') is $(});

# [18] 1 test
# qqs quote $)
$_ = qqs <<'END';
$)
END
ok($_, "$)", q{qqs('$)') is $)});

# [19] 1 test
# qqs quote $:
$_ = qqs <<'END';
$:
END
ok($_, "$:", q{qqs('$:') is $:});

# [20] 1 test
# qqs quote $^D
$_ = qqs <<'END';
$^D
END
ok($_, "$^D", q{qqs('$^D') is $^D});

# [21] 1 test
# qqs quote $^F
$_ = qqs <<'END';
$^F
END
ok($_, "$^F", q{qqs('$^F') is $^F});

# [22] 1 test
# qqs quote $^I
local $^I = '.bak';
$_ = qqs <<'END';
$^I
END
ok($_, "$^I", q{qqs('$^I') is $^I});

# [23] 1 test
# qqs quote $^L
$_ = qqs <<'END';
$^L
END
ok($_, "$^L", q{qqs('$^L') is $^L});

# [24] 1 test
# qqs quote $^P
$_ = qqs <<'END';
$^P
END
ok($_, "$^P", q{qqs('$^P') is $^P});

# [25] 1 test
# qqs quote $^T
$_ = qqs <<'END';
$^T
END
ok($_, "$^T", q{qqs('$^T') is $^T});

# [26] 1 test
# qqs quote $^W --- always 1 on Sjis module
$_ = qqs <<'END';
$^W
END
ok($_, "1", q{qqs('$^W') is $^W});

# [27] 1 test
# qqs quote $^X
$_ = qqs <<'END';
$^X
END
ok($_, "$^X", q{qqs('$^X') is $^X});

__END__
