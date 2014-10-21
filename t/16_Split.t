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
��
END
@_ = Split;
ok($_[0], "��", q{$_='��'; Split; $_[0] is '��'});

# [2,3,4] 1 test
# qqs quote $_
$_ = qqs <<'END';
�����A
END
@_ = Split('');
ok($_[0], "��", q{$_='�����A'; Split(''); $_[0] is '��'});
ok($_[1], "��", q{$_='�����A'; Split(''); $_[1] is '��'});
ok($_[2], "�A", q{$_='�����A'; Split(''); $_[2] is '�A'});

# [5,6,7] 1 test
# qqs quote $_
my $a = qqs <<'END';
�����A
END
@_ = Split('',$a);
ok($_[0], "��", q{$a='�����A'; Split('',$a); $_[0] is '��'});
ok($_[1], "��", q{$a='�����A'; Split('',$a); $_[1] is '��'});
ok($_[2], "�A", q{$a='�����A'; Split('',$a); $_[2] is '�A'});

# [8,9] 1 test
# qqs quote $_
$a = qqs <<'END';
�����A
END
@_ = Split('',$a,2);
ok($_[0], "��",   q{$a='�����A'; Split('',$a,2); $_[0] is '��'});
ok($_[1], "���A", q{$a='�����A'; Split('',$a,2); $_[1] is '���A'});

# [10,11,12] 1 test
# qqs quote $_
$_ = qqs <<'END';
��,��,�A
END
@_ = Split(',');
ok($_[0], "��", q{$_='��,��,�A'; Split(','); $_[0] is '��'});
ok($_[1], "��", q{$_='��,��,�A'; Split(','); $_[1] is '��'});
ok($_[2], "�A", q{$_='��,��,�A'; Split(','); $_[2] is '�A'});

# [13,14,15] 1 test
# qqs quote $_
$a = qqs <<'END';
��,��,�A
END
@_ = Split(',',$a);
ok($_[0], "��", q{$a='��,��,�A'; Split(',',$a); $_[0] is '��'});
ok($_[1], "��", q{$a='��,��,�A'; Split(',',$a); $_[1] is '��'});
ok($_[2], "�A", q{$a='��,��,�A'; Split(',',$a); $_[2] is '�A'});

# [16,17] 1 test
# qqs quote $_
$a = qqs <<'END';
��,��,�A
END
@_ = Split(',',$a,2);
ok($_[0], "��",    q{$a='��,��,�A'; Split(',',$a,2); $_[0] is '��'});
ok($_[1], "��,�A", q{$a='��,��,�A'; Split(',',$a,2); $_[1] is '��,�A'});

__END__
