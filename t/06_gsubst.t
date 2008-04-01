use strict;
use Test;

my $tests;

BEGIN {
    $tests = 283;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
ABC
123
END
ok($_, '123DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'ABC\n123')});

# [2] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[A]
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[A]\nx')});

# [3] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[\101]
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[\101]\nx')});

# [4] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[\x41]
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[\x41]\nx')});

# [5] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\x00";
gsubst($_,<<'END');
[\c@]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\c@]\nx')});

# [6] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
gsubst($_,<<'END');
[\0]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\0]\nx')});

# [7] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
gsubst($_,<<'END');
[\n]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\n]\nx')});

# [8] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\r";
gsubst($_,<<'END');
[\r]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\r]\nx')});

# [9] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
gsubst($_,<<'END');
[\t]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\t]\nx')});

# [10] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\f";
gsubst($_,<<'END');
[\f]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\f]\nx')});

# [11] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\b";
gsubst($_,<<'END');
[\b]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\b]\nx')});

# [12] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\a";
gsubst($_,<<'END');
[\a]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\a]\nx')});

# [13] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\e";
gsubst($_,<<'END');
[\e]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\e]\nx')});

# [14] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
[\d]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\d]\nx')});

# [15] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
[\D]
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx1', q{gsubst($_,'[\D]\nx')});

# [16] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
[\w]
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[\w]\nx')});

# [17] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#';
gsubst($_,<<'END');
[\W]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\W]\nx')});

# [18] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
gsubst($_,<<'END');
[\s]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\s]\nx')});

# [19] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[\S]
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[\S]\nx')});

# [20] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[A-C]
x
END
ok($_, 'xxxDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[A-C]\nx')});

# [21] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[\101-\103]
x
END
ok($_, 'xxxDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[\101-\103]\nx')});

# [22] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[\x41-\x43]
x
END
ok($_, 'xxxDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'[\x41-\x43]\nx')});

# [23] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\x00";
gsubst($_,<<'END');
[\c@-\cB]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\c@-\cB]\nx')});

# [24] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
gsubst($_,<<'END');
[\0-\002]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\0-\002]\nx')});

# [25] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
gsubst($_,<<'END');
[\n-\x0C]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\n-\x0C]\nx')});

# [26] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\r";
gsubst($_,<<'END');
[\r-\x0F]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\r-\x0F]\nx')});

# [27] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
gsubst($_,<<'END');
[\t-\x0B]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\t-\x0B]\nx')});

# [28] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\f";
gsubst($_,<<'END');
[\f-\x0E]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\f-\x0E]\nx')});

# [29] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\b";
gsubst($_,<<'END');
[\b-\x0A]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\b-\x0A]\nx')});

# [30] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\a";
gsubst($_,<<'END');
[\a-\x09]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\a-\x09]\nx')});

# [31] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\e";
gsubst($_,<<'END');
[\e-\x1D]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[\e-\x1D]\nx')});

# [32] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^A]
x
END
ok($_, 'Axxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^A]\nx')});

# [33] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^\101]
x
END
ok($_, 'Axxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^\101]\nx')});

# [34] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^\x41]
x
END
ok($_, 'Axxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^\x41]\nx')});

# [35] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\x00";
gsubst($_,<<'END');
[^\c@]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\x00", q{gsubst($_,'[^\c@]\nx')});

# [36] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
gsubst($_,<<'END');
[^\0]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\0", q{gsubst($_,'[^\0]\nx')});

# [37] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
gsubst($_,<<'END');
[^\n]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\n", q{gsubst($_,'[^\n]\nx')});

# [38] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\r";
gsubst($_,<<'END');
[^\r]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\r", q{gsubst($_,'[^\r]\nx')});

# [39] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
gsubst($_,<<'END');
[^\t]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\t", q{gsubst($_,'[^\t]\nx')});

# [40] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\f";
gsubst($_,<<'END');
[^\f]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\f", q{gsubst($_,'[^\f]\nx')});

# [41] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\b";
gsubst($_,<<'END');
[^\b]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\b", q{gsubst($_,'[^\b]\nx')});

# [42] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\a";
gsubst($_,<<'END');
[^\a]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\a", q{gsubst($_,'[^\a]\nx')});

# [43] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\e";
gsubst($_,<<'END');
[^\e]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\e", q{gsubst($_,'[^\e]\nx')});

# [44] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
[^\d]
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx1', q{gsubst($_,'[^\d]\nx')});

# [45] 1 test
# substitution
@_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_[0],<<'END');
[^\D]
x
END
ok($_[0], 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_[0],'[^\D]\nx')});

# [46] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#';
gsubst($_,<<'END');
[^\w]
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'[^\w]\nx')});

# [47] 1 test
# substitution
@_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#';
gsubst($_[0],<<'END');
[^\W]
x
END
ok($_[0], 'xxxxxxxxxxxxxxxxxxxxxxxxxx#', q{gsubst($_[0],'[^\W]\nx')});

# [48] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
gsubst($_,<<'END');
[^\s]
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx ', q{gsubst($_,'[^\s]\nx')});

# [49] 1 test
# substitution
@_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
gsubst($_[0],<<'END');
[^\S]
x
END
ok($_[0], 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_[0],'[^\S]\nx')});

# [50] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^A-C]
x
END
ok($_, 'ABCxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^A-C]\nx')});

# [51] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^\101-\103]
x
END
ok($_, 'ABCxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^\101-\103]\nx')});

# [52] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
[^\x41-\x43]
x
END
ok($_, 'ABCxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'[^\x41-\x43]\nx')});

# [53] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\x00";
gsubst($_,<<'END');
[^\c@-\cB]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\x00", q{gsubst($_,'[^\c@-\cB]\nx')});

# [54] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
gsubst($_,<<'END');
[^\0-\002]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\0", q{gsubst($_,'[^\0-\002]\nx')});

# [55] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
gsubst($_,<<'END');
[^\n-\x0C]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\n", q{gsubst($_,'[^\n-\x0C]\nx')});

# [56] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\r";
gsubst($_,<<'END');
[^\r-\x0F]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\r", q{gsubst($_,'[^\r-\x0F]\nx')});

# [57] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
gsubst($_,<<'END');
[^\t-\x0B]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\t", q{gsubst($_,'[^\t-\x0B]\nx')});

# [58] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\f";
gsubst($_,<<'END');
[^\f-\x0E]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\f", q{gsubst($_,'[^\f-\x0E]\nx')});

# [59] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\b";
gsubst($_,<<'END');
[^\b-\x0A]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\b", q{gsubst($_,'[^\b-\x0A]\nx')});

# [60] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\a";
gsubst($_,<<'END');
[^\a-\x09]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\a", q{gsubst($_,'[^\a-\x09]\nx')});

# [61] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\e";
gsubst($_,<<'END');
[^\e-\x1D]
x
END
ok($_, "xxxxxxxxxxxxxxxxxxxxxxxxxx\e", q{gsubst($_,'[^\e-\x1D]\nx')});

# [62] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
A
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'A\nx')});

# [63] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
\101
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'\101\nx')});

# [64] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
\x41
x
END
ok($_, 'xBCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'\x41\nx')});

# [65] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\x00";
gsubst($_,<<'END');
\c@
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\c@\nx')});

# [66] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
gsubst($_,<<'END');
\0
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\0\nx')});

# [67] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
gsubst($_,<<'END');
\n
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\n\nx')});

# [68] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\r";
gsubst($_,<<'END');
\r
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\r\nx')});

# [69] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
gsubst($_,<<'END');
\t
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\t\nx')});

# [70] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\f";
gsubst($_,<<'END');
\f
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\f\nx')});

# [71] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\a";
gsubst($_,<<'END');
\a
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\a\nx')});

# [72] 1 test
# substitution
$_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\e";
gsubst($_,<<'END');
\e
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\e\nx')});

# [73] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
\d
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\d\nx')});

# [74] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
\D
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx1', q{gsubst($_,'\D\nx')});

# [75] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1';
gsubst($_,<<'END');
\w
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'\w\nx')});

# [76] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#';
gsubst($_,<<'END');
\W
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\W\nx')});

# [77] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';
gsubst($_,<<'END');
\s
x
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZx', q{gsubst($_,'\s\nx')});

# [78] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
\S
x
END
ok($_, 'xxxxxxxxxxxxxxxxxxxxxxxxxx', q{gsubst($_,'\S\nx')});

# [79] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
^ABCDE
12345
END
ok($_, '12345FGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'^ABCDEF\n12345')});

# [80] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
VWXYZ$
67890
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTU67890', q{gsubst($_,'VWXYZ$\n67890')});

# [81] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
DEF|GHI
123
END
ok($_, 'ABC123123JKLMNOPQRSTUVWXYZ', q{gsubst($_,'DEF|GHI\n123')});

# koko ( )

# [82] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
ABC?
123
END
ok($_, '123DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'ABC?\n123')});

# [83] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
ABD?
123
END
ok($_, '123CDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'ABD?\n123')});

# [84] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
ACD?
123
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst($_,'ACD?\n123')});

# [85] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK+
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst('..K..','IJK+\n123456')});

# [86] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK+
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst('..KKKKK..','IJK+\n123456')});

# [87] 1 test
# substitution
$_ = 'ABCDEFGHIJLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK+
123456
END
ok($_, 'ABCDEFGHIJLMNOPQRSTUVWXYZ', q{gsubst('..IJLM..','IJK+\n123456')});

# [88] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK*
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst('..K..','IJK*\n123456')});

# [89] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK*
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst('..KKKKK..','IJK*\n123456')});

# [90] 1 test
# substitution
$_ = 'ABCDEFGHIJLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK*
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst('..IJLM..','IJK*\n123456')});

# [91] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{1}
123456
END
ok($_, 'ABCDEFGH123456KKKKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{1}\n123456')});

# [92] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{2}
123456
END
ok($_, 'ABCDEFGH123456KKKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{2}\n123456')});

# [93] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{3}
123456
END
ok($_, 'ABCDEFGH123456KKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{3}\n123456')});

# [94] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{4}
123456
END
ok($_, 'ABCDEFGH123456KLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{4}\n123456')});

# [95] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{5}
123456
END
ok($_, 'ABCDEFGH123456LMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{5}\n123456')});

# [96] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{6}
123456
END
ok($_, 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{6}\n123456')});

# [97] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{1,3}
123456
END
ok($_, 'ABCDEFGH123456KKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{1,3}\n123456')});

# [98] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{1,3}?
123456
END
ok($_, 'ABCDEFGH123456KKKKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{1,3}?\n123456')});

# [99] 1 test
# substitution
$_ = 'ABCDEFGHIJKKKKKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
IJK{0,3}?
123456
END
ok($_, 'ABCDEFGH123456KKKKKLMNOPQRSTUVWXYZ', q{gsubst($_,'IJK{0,3}?\n123456')});

# [100] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
.
1
END
ok($_, '11111111111111111111111111', q{gsubst($_,'.\n1')});

# [101] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
..
12
END
ok($_, '12121212121212121212121212', q{gsubst($_,'..\n12')});

# [102] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
gsubst($_,<<'END');
...
123
END
ok($_, '123123123123123123123123YZ', q{gsubst($_,'...\n123')});

# [103] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
$var
123
END
ok($_, 'ABCDEFGHIJKLMNOPQR123VWXYZ', q{gsubst($_,'$var\n123')});

# [104] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
PQR$var
456123
END
ok($_, 'ABCDEFGHIJKLMNO456123VWXYZ', q{gsubst($_,'PQR$var\n456123')});

# [105] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
PQR${var}VWX
456123789
END
ok($_, 'ABCDEFGHIJKLMNO456123789YZ', q{gsubst($_,'PQR${var}VWX\n456123789')});

# [106] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
\L$var\E
123
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqr123vwxyz', q{gsubst($_,'\L$var\E\n123')});

# [107] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
\L$var
123
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqr123vwxyz', q{gsubst($_,'\L$var\n123')});

# [108] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'STU';
gsubst($_,<<'END');
\L$var\Evwx
123456
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqr123456yz', q{gsubst($_,'\L$var\Evwx\n123456')});

# [109] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'stu';
gsubst($_,<<'END');
\U$var\E
123
END
ok($_, 'ABCDEFGHIJKLMNOPQR123VWXYZabcdefghijklmnopqrstuvwxyz', q{gsubst($_,'\U$var\E\n123')});

# [110] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'stu';
gsubst($_,<<'END');
\U$var
123
END
ok($_, 'ABCDEFGHIJKLMNOPQR123VWXYZabcdefghijklmnopqrstuvwxyz', q{gsubst($_,'\U$var\n123')});

# [111] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'stu';
gsubst($_,<<'END');
\U$var\EVWX
123456
END
ok($_, 'ABCDEFGHIJKLMNOPQR123456YZabcdefghijklmnopqrstuvwxyz', q{gsubst($_,'\U$var\EVWX\n123456')});

# [112] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'Stu';
gsubst($_,<<'END');
\l$var
123
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqr123vwxyz', q{gsubst($_,'\l$var\n123')});

# [113] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'sTU';
gsubst($_,<<'END');
\u$var
123
END
ok($_, 'ABCDEFGHIJKLMNOPQR123VWXYZabcdefghijklmnopqrstuvwxyz', q{gsubst($_,'\u$var\n123')});

# [114] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'zabc';
gsubst($_,<<'END');
\u\L$var
1234
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz', q{gsubst('zabc','\u\L$var\n1234')});

# [115] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'zabc';
gsubst($_,<<'END');
\L\u$var
1234
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz', q{gsubst('zabc','\L\u$var\n1234')});

# [116] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'ZABC';
gsubst($_,<<'END');
\u\L$var
1234
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz', q{gsubst('ZABC','\u\L$var\n1234')});

# [117] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
use vars qw($var);
$var = 'ZABC';
gsubst($_,<<'END');
\L\u$var
1234
END
ok($_, 'ABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz', q{gsubst('ZABC','\L\u$var\n1234')});

# [118] 1 test
# substitution
$_ = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'ZABC';
gsubst($_,<<'END');
\l\U$var
1234
END
ok($_, 'abcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst('ZABC','\l\U$var\n1234')});

# [119] 1 test
# substitution
$_ = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'ZABC';
gsubst($_,<<'END');
\U\l$var
1234
END
ok($_, 'abcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst('ZABC','\U\l$var\n1234')});

# [120] 1 test
# substitution
$_ = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'zabc';
gsubst($_,<<'END');
\l\U$var
1234
END
ok($_, 'abcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst('zabc','\l\U$var\n1234')});

# [121] 1 test
# substitution
$_ = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
use vars qw($var);
$var = 'zabc';
gsubst($_,<<'END');
\U\l$var
1234
END
ok($_, 'abcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ', q{gsubst('zabc','\U\l$var\n1234')});

# [122] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\Q$var\E
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\Q$var\E\n1234')});

# [123] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\U\Q$var\E\E
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\U\Q$var\E\E\n1234')});

# [124] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\U\Q$var\E
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\U\Q$var\E\n1234')});

# [125] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\U\Q$var
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\U\Q$var\n1234')});

# [126] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\Q\U$var\E\E
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\Q\U$var\E\E\n1234')});

# [127] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\Q\U$var\E
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\Q\U$var\E\n1234')});

# [128] 1 test
# substitution
$_ = 'ABCDEFGHIJKL$MNOPQRSTUVWXYZ';
use vars qw($var);
$var = '$mno';
gsubst($_,<<'END');
\Q\U$var
1234
END
ok($_, 'ABCDEFGHIJKL1234PQRSTUVWXYZ', q{gsubst($_,'\Q\U$var\n1234')});

# [129] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\L\Q$var\E\E
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,'\L\Q$var\E\E\n1234')});

# [130] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\L\Q$var\E
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,'\L\Q$var\E\n1234')});

# [131] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\L\Q$var
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,'\L\Q$var\n1234')});

# [132] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\Q\L$var\E\E
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,\Q\L$var\E\E\n1234')});

# [133] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\Q\L$var\E
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,'\Q\L$var\E\n1234')});

# [134] 1 test
# substitution
$_ = 'abcdefghijkl$mnopqrstuvwxyz';
use vars qw($var);
$var = '$MNO';
gsubst($_,<<'END');
\Q\L$var
1234
END
ok($_, 'abcdefghijkl1234pqrstuvwxyz', q{gsubst($_,'\Q\L$var\n1234')});

# [135] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
123エオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
アイウ
123
END
ok($_[0], $_[1], q{gsubst($_[0],'アイウ\n123')});

# [136] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[ア]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[ア]\nx')});

# [137] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[\203\101]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\203\101]\nx')});

# [138] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[\x83\x41]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\x83\x41\nx')});

# [139] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\x00";
gsubst($_[0],<<'END');
[\c@]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\c@]\nx')});

# [140] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\0";
gsubst($_[0],<<'END');
[\0]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\0]\nx')});

# [141] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\n";
gsubst($_[0],<<'END');
[\n]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\n]\nx')});

# [142] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\r";
gsubst($_[0],<<'END');
[\r]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\r]\nx')});

# [143] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\t";
gsubst($_[0],<<'END');
[\t]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\t]\nx')});

# [144] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\f";
gsubst($_[0],<<'END');
[\f]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\f]\nx')});

# [145] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\b";
gsubst($_[0],<<'END');
[\b]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\b]\nx')});

# [146] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\a";
gsubst($_[0],<<'END');
[\a]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\a]\nx')});

# [147] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\e";
gsubst($_[0],<<'END');
[\e]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\e]\nx')});

# [148] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[\d]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\d]\nx')});

# [149] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
xxxxxxxxxxxxxxxxxxxx1
END
gsubst($_[0],<<'END');
[\D]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\D]\nx')});

# [150] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[\w]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\w]\nx')});

# [151] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト#
xxxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[\W]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\W]\nx')});

# [152] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト 
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[\s]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\s]\nx')});

# [153] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[\S]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\S]\nx')});

# [154] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[ア-ウ]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[ア-ウ]\nx')});

# [155] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[\203\101-\203\105]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\203\101-\203\105]\nx')});

# [156] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
[\x83\x41-\x83\x45]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\x41-\x45]\nx')});

# [157] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\x00";
gsubst($_[0],<<'END');
[\c@-\cB]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\c@-\cB]\nx')});

# [158] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\0";
gsubst($_[0],<<'END');
[\0-\002]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\0-\002]\nx')});

# [159] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\n";
gsubst($_[0],<<'END');
[\n-\x0C]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\n-\x0C]\nx')});

# [160] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\r";
gsubst($_[0],<<'END');
[\r-\x0F]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\r-\x0F]\nx')});

# [161] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\t";
gsubst($_[0],<<'END');
[\t-\x0B]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\t-\x0B]\nx')});

# [162] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\f";
gsubst($_[0],<<'END');
[\f-\x0E]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\f-\x0E]\nx')});

# [163] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\b";
gsubst($_[0],<<'END');
[\b-\x0A]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\b-\x0A]\nx')});

# [164] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\a";
gsubst($_[0],<<'END');
[\a-\x09]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\a-\x09]\nx')});

# [165] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\e";
gsubst($_[0],<<'END');
[\e-\x1D]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[\e-\x1D]\nx')});

# [166] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^ア]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^ア]\nx')});

# [167] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^\203\101]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\203\101]\nx')});

# [168] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^\x83\x41]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\x83\x41]\nx')});

# [169] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\x00";
$_[1] .= "\x00";
gsubst($_[0],<<'END');
[^\c@]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\c@]\nx')});

# [170] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\0";
$_[1] .= "\0";
gsubst($_[0],<<'END');
[^\0]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\0]\nx')});

# [171] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\n";
$_[1] .= "\n";
gsubst($_[0],<<'END');
[^\n]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\n]\nx')});

# [172] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\r";
$_[1] .= "\r";
gsubst($_[0],<<'END');
[^\r]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\r]\nx')});

# [173] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\t";
$_[1] .= "\t";
gsubst($_[0],<<'END');
[^\t]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\t]\nx')});

# [174] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\f";
$_[1] .= "\f";
gsubst($_[0],<<'END');
[^\f]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\f]\nx')});

# [175] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\b";
$_[1] .= "\b";
gsubst($_[0],<<'END');
[^\b]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\b]\nx')});

# [176] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\a";
$_[1] .= "\a";
gsubst($_[0],<<'END');
[^\a]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\a]\nx')});

# [177] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\e";
$_[1] .= "\e";
gsubst($_[0],<<'END');
[^\e]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\e]\nx')});

# [178] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
xxxxxxxxxxxxxxxxxxxx1
END
gsubst($_[0],<<'END');
[^\d]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\d]\nx')});

# [179] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[^\D]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\D]\nx')});

# [180] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトa
xxxxxxxxxxxxxxxxxxxxa
END
gsubst($_[0],<<'END');
[^\w]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\w]\nx')});

# [181] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトa
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[^\W]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\W]\nx')});

# [182] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト 
xxxxxxxxxxxxxxxxxxxx 
END
gsubst($_[0],<<'END');
[^\s]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\s]\nx')});

# [183] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト 
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
[^\S]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\S]\nx')});

# [184] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^ア-ウ]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^ア-ウ]\nx')});

# [185] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^\203\101-\203\105]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\203\101-\203\103]\nx')});

# [186] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^\x83\x41-\x83\x45]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\x83\x41-\x83\x45]\nx')});

# [187] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
gsubst($_[0],<<'END');
[^\c@-\cB]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\c@-\cB]\nx')});

# [188] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\0";
$_[1] .= "\0";
gsubst($_[0],<<'END');
[^\0-\002]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\0-\002]\nx')});

# [189] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\n";
$_[1] .= "\n";
gsubst($_[0],<<'END');
[^\n-\x0C]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\n-\x0C]\nx')});

# [190] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\r";
$_[1] .= "\r";
gsubst($_[0],<<'END');
[^\r-\x0F]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\r-\x0F]\nx')});

# [191] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\t";
$_[1] .= "\t";
gsubst($_[0],<<'END');
[^\t-\x0B]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\t-\x0B]\nx')});

# [192] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\f";
$_[1] .= "\f";
gsubst($_[0],<<'END');
[^\f-\x0E]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\f-\x0E]\nx')});

# [193] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\b";
$_[1] .= "\b";
gsubst($_[0],<<'END');
[^\b-\x0A]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\b-\x0A]\nx')});

# [194] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\a";
$_[1] .= "\a";
gsubst($_[0],<<'END');
[^\a-\x09]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\a-\x09]\nx')});

# [195] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xxxxxxxxxxxxxxxxxxxx
END
$_[0] .= "\e";
$_[1] .= "\e";
gsubst($_[0],<<'END');
[^\e-\x1D]
x
END
ok($_[0], $_[1], q{gsubst($_[0],'[^\e-\x1D]\nx')});

# [196] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
ア
x
END
ok($_[0], $_[1], q{gsubst($_[0],'ア\nx')});

# [197] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
\203\101
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\203\101\nx')});

# [198] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
xイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
\x83\x41
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\x83\x41\nx')});

# [199] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\x00";
gsubst($_[0],<<'END');
\c@
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\c@\nx')});

# [200] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\0";
gsubst($_[0],<<'END');
\0
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\0\nx')});

# [201] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\n";
gsubst($_[0],<<'END');
\n
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\n\nx')});

# [202] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\r";
gsubst($_[0],<<'END');
\r
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\r\nx')});

# [203] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\t";
gsubst($_[0],<<'END');
\t
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\t\nx')});

# [204] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\f";
gsubst($_[0],<<'END');
\f
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\f\nx')});

# [205] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\a";
gsubst($_[0],<<'END');
\a
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\a\nx')});

# [206] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテトx
END
$_[0] .= "\e";
gsubst($_[0],<<'END');
\e
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\e\nx')});

# [207] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
\d
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\d\nx')});

# [208] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト1
xxxxxxxxxxxxxxxxxxxx1
END
gsubst($_[0],<<'END');
\D
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\D\nx')});

# [209] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトa
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
\w
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\w\nx')});

# [210] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトa
xxxxxxxxxxxxxxxxxxxxa
END
gsubst($_[0],<<'END');
\W
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\W\nx')});

# [211] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト 
アイウエオカキクケコサシスセソタチツテトx
END
gsubst($_[0],<<'END');
\s
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\s\nx')});

# [212] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト 
xxxxxxxxxxxxxxxxxxxx 
END
gsubst($_[0],<<'END');
\S
x
END
ok($_[0], $_[1], q{gsubst($_[0],'\S\nx')});

# [213] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
12345カキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
^アイウエオ
12345
END
ok($_[0], $_[1], q{gsubst($_[0],'^アイウエオ\n12345')});

# [214] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソ67890
END
gsubst($_[0],<<'END');
タチツテト$
67890
END
ok($_[0], $_[1], q{gsubst($_[0],'タチツテト$\n67890')});

# [215] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオ123123シスセソタチツテト
END
gsubst($_[0],<<'END');
カキク|ケコサ
123
END
ok($_[0], $_[1], q{gsubst($_[0],'カキク|ケコサ\n123')});

# koko ( )

# [216] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
123エオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
アイウ?
123
END
ok($_[0], $_[1], q{gsubst($_[0],'アイウ?\n123')});

# [217] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
123ウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
アイエ?
123
END
ok($_[0], $_[1], q{gsubst($_[0],'アイエ?\n123')});

# [218] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコサシスセソタチツテト
END
gsubst($_[0],<<'END');
アウエ?
123
END
ok($_[0], $_[1], q{gsubst($_[0],'アウエ?\n123')});

# [219] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス+
123456
END
ok($_[0], $_[1], q{gsubst('..ス..','サシス+\n123456')});

# [220] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスススススセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス+
123456
END
ok($_[0], $_[1], q{gsubst('..ススススス..','サシス+\n123456')});

# [221] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシセソタチツテト
アイウエオカキクケコサシセソタチツテト
END
gsubst($_[0],<<'END');
サシス+
123456
END
ok($_[0], $_[1], q{gsubst('..サシセ..','サシス+\n123456')});

# [222] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス*
123456
END
ok($_[0], $_[1], q{gsubst('..ス..','サシス*\n123456')});

# [223] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスススススセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス*
123456
END
ok($_[0], $_[1], q{gsubst('..ススススス..','サシス*\n123456')});

# [224] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス*
123456
END
ok($_[0], $_[1], q{gsubst('..サシセ..','サシス*\n123456')});

# [225] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456スススススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{1}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{1}\n123456')});

# [226] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456ススススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{2}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{2}\n123456')});

# [227] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456スススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{3}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{3}\n123456')});

# [228] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456ススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{4}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{4}\n123456')});

# [229] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456スセソタチツテト
END
gsubst($_[0],<<'END');
サシス{5}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{5}\n123456')});

# [230] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシススススススセソタチツテト
アイウエオカキクケコ123456セソタチツテト
END
gsubst($_[0],<<'END');
サシス{6}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{6}\n123456')});

# [231] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスススススセソタチツテト
アイウエオカキクケコ123456ススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{1,3}
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{1,3}\n123456')});

# [232] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスススススセソタチツテト
アイウエオカキクケコ123456ススススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{1,3}?
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{1,3}?\n123456')});

# [233] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスススススセソタチツテト
アイウエオカキクケコ123456スススススセソタチツテト
END
gsubst($_[0],<<'END');
サシス{0,3}?
123456
END
ok($_[0], $_[1], q{gsubst($_[0],'サシス{0,3}?\n123456')});

# [234] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
11111111111111111111
END
gsubst($_[0],<<'END');
.
1
END
ok($_[0], $_[1], q{gsubst($_[0],'.\n1')});

# [235] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
12121212121212121212
END
gsubst($_[0],<<'END');
..
12
END
ok($_[0], $_[1], q{gsubst($_[0],'..\n12')});

# [236] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
123123123123123123テト
END
gsubst($_[0],<<'END');
...
123
END
ok($_[0], $_[1], q{gsubst($_[0],'...\n123')});

# [237] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイウエオ123ケコサシスセソタチツテト
END
$var = qs <<'END';
カキク
END
gsubst($_[0],<<'END');
$var
123
END
ok($_[0], $_[1], q{gsubst($_[0],'$var\n123')});

# [238] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイ456123ケコサシスセソタチツテト
END
$var = qs <<'END';
カキク
END
gsubst($_[0],<<'END');
ウエオ$var
456123
END
ok($_[0], $_[1], q{gsubst($_[0],'ウエオ$var\n456123')});

# [239] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテト
アイ456123789シスセソタチツテト
END
$var = qs <<'END';
カキク
END
gsubst($_[0],<<'END');
ウエオ${var}ケコサ
456123789
END
ok($_[0], $_[1], q{gsubst($_[0],'ウエオ${var}ケコサ\n456123789')});

# [240] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\L$var\E
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\L$var\E\n123')});

# [241] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123defghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\L$var\E
123
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\L$var\E\n123')});

# [242] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123defghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\L$var\E
123
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\L$var\E\n123')});

# [243] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\L$var
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\L$var\n123')});

# [244] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123defghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\L$var
123
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\L$var\n123')});

# [245] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123defghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\L$var
123
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\L$var\n123')});

# [246] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123エオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\L$var\Eイウ
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\L$var\Eイウ\n123')});

# [247] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123456ghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\L$var\Edef
123456
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\L$var\Edef\n123456')});

# [248] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZ123456ghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\L$var\Edef
123456
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\L$var\Edef\n123')});

# [249] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\U$var\E
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\U$var\E\n123')});

# [250] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123DEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\U$var\E
123
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\U$var\E\n123')});

# [251] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123DEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\U$var\E
123
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\U$var\E\n123')});

# [252] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\U$var
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\U$var\n123')});

# [253] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123DEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\U$var
123
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\U$var\n123')});

# [254] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123DEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\U$var
123
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\U$var\n123')});

# [255] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123456エオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\U$var\Eイウ
123456
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\U$var\Eイウ\n123')});

# [256] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123456GHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ABC
END
gsubst($_[0],<<'END');
\U$var\EDEF
123456
END
ok($_[0], $_[1], q{$var='ABC'; gsubst($_[0],'\U$var\EDEF\n123')});

# [257] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテト123456GHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
abc
END
gsubst($_[0],<<'END');
\U$var\EDEF
123456
END
ok($_[0], $_[1], q{$var='abc'; gsubst($_[0],'\U$var\EDEF\n123')});

# [258] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\l$var
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\l$var\n123')});

# [259] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
123イウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = qs <<'END';
ア
END
gsubst($_[0],<<'END');
\u$var
123
END
ok($_[0], $_[1], q{$var='ア'; gsubst($_[0],'\u$var\n123')});

# [260] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz
END
$var = 'zabc';
gsubst($_[0],<<'END');
\u\L$var
1234
END
ok($_[0], $_[1], q{$var='zabc'; gsubst($_[0],'\u\L$var\n1234')});

# [261] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz
END
$var = 'zabc';
gsubst($_[0],<<'END');
\L\u$var
1234
END
ok($_[0], $_[1], q{$var='zabc'; gsubst($_[0],'\L\u$var\n1234')});

# [262] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz
END
$var = 'ZABC';
gsubst($_[0],<<'END');
\u\L$var
1234
END
ok($_[0], $_[1], q{$var='ZABC'; gsubst($_[0],'\u\L$var\n1234')});

# [263] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXY1234defghijklmnopqrstuvwxyz
END
$var = 'ZABC';
gsubst($_[0],<<'END');
\L\u$var
1234
END
ok($_[0], $_[1], q{$var='ZABC'; gsubst($_[0],'\L\u$var\n1234')});

# [264] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ
END
$var = 'ZABC';
gsubst($_[0],<<'END');
\l\U$var
1234
END
ok($_[0], $_[1], q{$var='ZABC'; gsubst($_[0],'\l\U$var\n1234')});

# [265] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ
END
$var = 'ZABC';
gsubst($_[0],<<'END');
\U\l$var
1234
END
ok($_[0], $_[1], q{$var='ZABC'; gsubst($_[0],'\U\l$var\n1234')});

# [266] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ
END
$var = 'zabc';
gsubst($_[0],<<'END');
\l\U$var
1234
END
ok($_[0], $_[1], q{$var='zabc'; gsubst($_[0],'\l\U$var\n1234')});

# [267] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
アイウエオカキクケコサシスセソタチツテトabcdefghijklmnopqrstuvwxy1234DEFGHIJKLMNOPQRSTUVWXYZ
END
$var = 'zabc';
gsubst($_[0],<<'END');
\U\l$var
1234
END
ok($_[0], $_[1], q{$var='zabc'; gsubst($_[0],'\U\l$var\n1234')});

# [268] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q$var\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\Q$var\E\n1234')});

# [269] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\U\Q$var\E\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\E\E\n1234')});

# [270] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\U\Q$var\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\E\n1234')});

# [271] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\U\Q$var
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\n1234')});

# [272] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$mno';
gsubst($_[0],<<'END');
\Q\U$var\E\E
1234
END
ok($_[0], $_[1], q{$var='$mno'; gsubst($_[0],'\U\Q$var\E\E\n1234')});

# [273] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$mno';
gsubst($_[0],<<'END');
\Q\U$var\E
1234
END
ok($_[0], $_[1], q{$var='$mno'; gsubst($_[0],'\U\Q$var\E\n1234')});

# [274] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$mno';
gsubst($_[0],<<'END');
\Q\U$var
1234
END
ok($_[0], $_[1], q{$var='$mno'; gsubst($_[0],'\U\Q$var\n1234')});

# [275] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\U$var\E\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\E\E\n1234')});

# [276] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\U$var\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\E\n1234')});

# [277] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL$MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKL1234PQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\U$var
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\U\Q$var\n1234')});

# [278] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\L\Q$var\E\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\L\Q$var\E\E\n1234')});

# [279] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\L\Q$var\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\L\Q$var\E\n1234')});

# [280] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\L\Q$var
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\L\Q$var\n1234')});

# [281] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\L$var\E\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\Q\L$var\E\E\n1234')});

# [282] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\L$var\E
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\Q\L$var\E\n1234')});

# [283] 1 test
# substitution
@_ = qs <<'END';
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl$mnopqrstuvwxyz
アイウエオカキクケコサシスセソタチツテトABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl1234pqrstuvwxyz
END
$var = '$MNO';
gsubst($_[0],<<'END');
\Q\L$var
1234
END
ok($_[0], $_[1], q{$var='$MNO'; gsubst($_[0],'\Q\L$var\n1234')});

__END__
