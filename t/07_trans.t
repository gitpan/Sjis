use strict;
use Test;

my $tests;

BEGIN {
    $tests = 42;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
ABC
123
END
ok($_, '123DEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'ABC\n123')});

# [2] 1 test
# transliteration
my $string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($string,<<'END');
ABC
123
END
ok($string, '123DEFGHIJKLMNOPQRSTUVWXYZ', q{trans($string,'ABC\n123')});

# [3] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
ABCDEF
123
END
ok($_, '123333GHIJKLMNOPQRSTUVWXYZ', q{trans($_,'ABCDEF\n123')});

# [4] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
A-Z
N-ZA-M
END
ok($_, 'NOPQRSTUVWXYZABCDEFGHIJKLM', q{trans($_,'A-Z\nN-MA-Z')});

# [5] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
N-ZA-M
A-Z
END
ok($_, 'NOPQRSTUVWXYZABCDEFGHIJKLM', q{trans($_,'N-MA-Z\nA-Z')});

# [6] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
A-Z

END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'A-Z\n')});

# [7] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
A-Z
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'A-Z')});

# [8] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');

END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'\n')});

# [9] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END');
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'')});

# [10] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','d');
ABC

END
ok($_, 'DEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'ABC\n','d')});

# [11] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','d');
ABC
END
ok($_, 'DEFGHIJKLMNOPQRSTUVWXYZ', q{trans($_,'ABC','d')});

# [12] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','c');
A-W
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWxxx', q{trans($_,'A-W\nx','c')});

# [13] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','cd');
A-W

END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVW', q{trans($_,'A-W\n','cd')});

# [14] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','s');
X-Z
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWx', q{trans($_,'X-Z\nx','s')});

# [15] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','cs');
X-Z
x
END
ok($_, 'xXYZ', q{trans($_,'X-Z\nx','cs')});

# [16] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','ds');
ABCDEF
111
END
ok($_, '1GHIJKLMNOPQRSTUVWXYZ', q{trans($_,'ABCDEF\n111','ds')});

# [17] 1 test
# transliteration
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
trans($_,<<'END','cds');
ABCDEF
1
END
ok($_, 'ABCDEF1', q{trans($_,'ABCDEF\n1','cds')});

# [18] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
アイウ
123
END
ok($_, '123エオカキクケコサシスセソタチツテト', q{trans($_,'アイウ\n123')});

# [19] 1 test
# transliteration
$string = 'アイウエオカキクケコサシスセソタチツテト';
trans($string,<<'END');
アイウ
123
END
ok($string, '123エオカキクケコサシスセソタチツテト', q{trans($string,'アイウ\n123')});

# [20] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
アイウエオカ
123
END
ok($_, '123333キクケコサシスセソタチツテト', q{trans($_,'アイウエオカ\n123')});

# [21] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
カ-コサ-ソ
サ-ソカ-コ
END
ok($_, 'アイウエオサシスセソカキクケコタチツテト', q{trans($_,'カ-コサ-ソ\nサ-ソカ-コ')});

# [22] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
サ-ソカ-コ
カ-コサ-ソ
END
ok($_, 'アイウエオサシスセソカキクケコタチツテト', q{trans($_,'サ-ソカ-コ\nカ-コサ-ソ')});

# [23] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
ア-ト

END
ok($_, 'アイウエオカキクケコサシスセソタチツテト', q{trans($_,'ア-ト\n')});

# [24] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
ア-ト
END
ok($_, 'アイウエオカキクケコサシスセソタチツテト', q{trans($_,'ア-ト')});

# [25] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');

END
ok($_, 'アイウエオカキクケコサシスセソタチツテト', q{trans($_,'\n')});

# [26] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
END
ok($_, 'アイウエオカキクケコサシスセソタチツテト', q{trans($_,'')});

# [27] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','d');
アイウ

END
ok($_, 'エオカキクケコサシスセソタチツテト', q{trans($_,'アイウ\n','d')});

# [28] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','d');
アイウ
END
ok($_, 'エオカキクケコサシスセソタチツテト', q{trans($_,'アイウ','d')});

# [29] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','c');
カ-コ
x
END
ok($_, 'xxxxxカキクケコxxxxxxxxxx', q{trans($_,'カ-コ\nx','c')});

# [30] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','cd');
カ-コ

END
ok($_, 'カキクケコ', q{trans($_,カ-コ\n','cd')});

# [31] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','s');
タ-ト
x
END
ok($_, 'アイウエオカキクケコサシスセソx', q{trans($_,'タ-ト\nx','s')});

# [32] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','cs');
タ-ト
x
END
ok($_, 'xタチツテト', q{trans($_,'タ-ト\nx','cs')});

# [33] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','ds');
アイウエオカキクケコ
111
END
ok($_, '1サシスセソタチツテト', q{trans($_,'アイウエオカキクケコ\n111','ds')});

# [34] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','cds');
アイウエオカキクケコ
1
END
ok($_, 'アイウエオカキクケコ1', q{trans($_,'アイウエオカキクケコ\n1','cds')});

# [35] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
アイウ
１２３
END
ok($_, '１２３エオカキクケコサシスセソタチツテト', q{trans($_,'アイウ\n１２３')});

# [36] 1 test
# transliteration
$string = 'アイウエオカキクケコサシスセソタチツテト';
trans($string,<<'END');
アイウ
１２３
END
ok($string, '１２３エオカキクケコサシスセソタチツテト', q{trans($string,'アイウ\n１２３')});

# [37] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END');
アイウエオカ
１２３
END
ok($_, '１２３３３３キクケコサシスセソタチツテト', q{trans($_,'アイウエオカ\n１２３')});

# [38] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','c');
カ-コ
ｘ
END
ok($_, 'ｘｘｘｘｘカキクケコｘｘｘｘｘｘｘｘｘｘ', q{trans($_,'カ-コ\nｘ','c')});

# [39] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','s');
タ-ト
ｘ
END
ok($_, 'アイウエオカキクケコサシスセソｘ', q{trans($_,'タ-ト\nｘ','s')});

# [40] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','cs');
タ-ト
ｘ
END
ok($_, 'ｘタチツテト', q{trans($_,'タ-ト\nｘ','cs')});

# [41] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','ds');
アイウエオカキクケコ
１１１
END
ok($_, '１サシスセソタチツテト', q{trans($_,'アイウエオカキクケコ\n１１１','ds')});

# [42] 1 test
# transliteration
$_ = 'アイウエオカキクケコサシスセソタチツテト';
trans($_,<<'END','cds');
アイウエオカキクケコ
１
END
ok($_, 'アイウエオカキクケコ１', q{trans($_,'アイウエオカキクケコ\n１','cds')});

__END__
