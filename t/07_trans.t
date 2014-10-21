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
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A�C�E
123
END
ok($_, '123�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E\n123')});

# [19] 1 test
# transliteration
$string = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($string,<<'END');
�A�C�E
123
END
ok($string, '123�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($string,'�A�C�E\n123')});

# [20] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A�C�E�G�I�J
123
END
ok($_, '123333�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E�G�I�J\n123')});

# [21] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�J-�R�T-�\
�T-�\�J-�R
END
ok($_, '�A�C�E�G�I�T�V�X�Z�\�J�L�N�P�R�^�`�c�e�g', q{trans($_,'�J-�R�T-�\\n�T-�\�J-�R')});

# [22] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�T-�\�J-�R
�J-�R�T-�\
END
ok($_, '�A�C�E�G�I�T�V�X�Z�\�J�L�N�P�R�^�`�c�e�g', q{trans($_,'�T-�\�J-�R\n�J-�R�T-�\')});

# [23] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A-�g

END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A-�g\n')});

# [24] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A-�g
END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A-�g')});

# [25] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');

END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'\n')});

# [26] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'')});

# [27] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','d');
�A�C�E

END
ok($_, '�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E\n','d')});

# [28] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','d');
�A�C�E
END
ok($_, '�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E','d')});

# [29] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','c');
�J-�R
x
END
ok($_, 'xxxxx�J�L�N�P�Rxxxxxxxxxx', q{trans($_,'�J-�R\nx','c')});

# [30] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','cd');
�J-�R

END
ok($_, '�J�L�N�P�R', q{trans($_,�J-�R\n','cd')});

# [31] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','s');
�^-�g
x
END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\x', q{trans($_,'�^-�g\nx','s')});

# [32] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','cs');
�^-�g
x
END
ok($_, 'x�^�`�c�e�g', q{trans($_,'�^-�g\nx','cs')});

# [33] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','ds');
�A�C�E�G�I�J�L�N�P�R
111
END
ok($_, '1�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E�G�I�J�L�N�P�R\n111','ds')});

# [34] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','cds');
�A�C�E�G�I�J�L�N�P�R
1
END
ok($_, '�A�C�E�G�I�J�L�N�P�R1', q{trans($_,'�A�C�E�G�I�J�L�N�P�R\n1','cds')});

# [35] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A�C�E
�P�Q�R
END
ok($_, '�P�Q�R�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E\n�P�Q�R')});

# [36] 1 test
# transliteration
$string = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($string,<<'END');
�A�C�E
�P�Q�R
END
ok($string, '�P�Q�R�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($string,'�A�C�E\n�P�Q�R')});

# [37] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END');
�A�C�E�G�I�J
�P�Q�R
END
ok($_, '�P�Q�R�R�R�R�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E�G�I�J\n�P�Q�R')});

# [38] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','c');
�J-�R
��
END
ok($_, '�����������J�L�N�P�R��������������������', q{trans($_,'�J-�R\n��','c')});

# [39] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','s');
�^-�g
��
END
ok($_, '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\��', q{trans($_,'�^-�g\n��','s')});

# [40] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','cs');
�^-�g
��
END
ok($_, '���^�`�c�e�g', q{trans($_,'�^-�g\n��','cs')});

# [41] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','ds');
�A�C�E�G�I�J�L�N�P�R
�P�P�P
END
ok($_, '�P�T�V�X�Z�\�^�`�c�e�g', q{trans($_,'�A�C�E�G�I�J�L�N�P�R\n�P�P�P','ds')});

# [42] 1 test
# transliteration
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
trans($_,<<'END','cds');
�A�C�E�G�I�J�L�N�P�R
�P
END
ok($_, '�A�C�E�G�I�J�L�N�P�R�P', q{trans($_,'�A�C�E�G�I�J�L�N�P�R\n�P','cds')});

__END__
