use strict;
use Test;

my $tests;

BEGIN {
    $tests = 3;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# qqx quote $_
$_ = qqx <<'END';
dir /b
END
ok($_, `dir /b`, q{dir /b});

# [2] 1 test
# qqx quote $_
unlink 'temp';
$_ = qqx <<'END';
copy Sjis.pm temp
END
ok(-e 'temp', 1, q{copy Sjis.pm temp});

# [3] 1 test
# qqx quote $_
$_ = qqx <<'END';
del temp
END
my $e = (-e 'temp') ? 1 : 0;
ok($e, 0, q{del temp});

__END__
