use strict;
use Test;

my $tests;

BEGIN {
    $tests = 17;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# qqs quote $_
$_ = qqs <<'END';
亜
END
@_ = Split;
ok($_[0], "亜", q{$_='亜'; Split; $_[0] is '亜'});

# [2,3,4] 1 test
# qqs quote $_
$_ = qqs <<'END';
亜あア
END
@_ = Split('');
ok($_[0], "亜", q{$_='亜あア'; Split(''); $_[0] is '亜'});
ok($_[1], "あ", q{$_='亜あア'; Split(''); $_[1] is 'あ'});
ok($_[2], "ア", q{$_='亜あア'; Split(''); $_[2] is 'ア'});

# [5,6,7] 1 test
# qqs quote $_
my $a = qqs <<'END';
亜あア
END
@_ = Split('',$a);
ok($_[0], "亜", q{$a='亜あア'; Split('',$a); $_[0] is '亜'});
ok($_[1], "あ", q{$a='亜あア'; Split('',$a); $_[1] is 'あ'});
ok($_[2], "ア", q{$a='亜あア'; Split('',$a); $_[2] is 'ア'});

# [8,9] 1 test
# qqs quote $_
$a = qqs <<'END';
亜あア
END
@_ = Split('',$a,2);
ok($_[0], "亜",   q{$a='亜あア'; Split('',$a,2); $_[0] is '亜'});
ok($_[1], "あア", q{$a='亜あア'; Split('',$a,2); $_[1] is 'あア'});

# [10,11,12] 1 test
# qqs quote $_
$_ = qqs <<'END';
亜,あ,ア
END
@_ = Split(',');
ok($_[0], "亜", q{$_='亜,あ,ア'; Split(','); $_[0] is '亜'});
ok($_[1], "あ", q{$_='亜,あ,ア'; Split(','); $_[1] is 'あ'});
ok($_[2], "ア", q{$_='亜,あ,ア'; Split(','); $_[2] is 'ア'});

# [13,14,15] 1 test
# qqs quote $_
$a = qqs <<'END';
亜,あ,ア
END
@_ = Split(',',$a);
ok($_[0], "亜", q{$a='亜,あ,ア'; Split(',',$a); $_[0] is '亜'});
ok($_[1], "あ", q{$a='亜,あ,ア'; Split(',',$a); $_[1] is 'あ'});
ok($_[2], "ア", q{$a='亜,あ,ア'; Split(',',$a); $_[2] is 'ア'});

# [16,17] 1 test
# qqs quote $_
$a = qqs <<'END';
亜,あ,ア
END
@_ = Split(',',$a,2);
ok($_[0], "亜",    q{$a='亜,あ,ア'; Split(',',$a,2); $_[0] is '亜'});
ok($_[1], "あ,ア", q{$a='亜,あ,ア'; Split(',',$a,2); $_[1] is 'あ,ア'});

__END__
