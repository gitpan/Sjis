use strict;
use Test;

my $tests;

BEGIN {
    $tests = 8;
    plan tests => $tests;
}

use Sjis;

# [1] 1 test
# substitution
@_ = (qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z));
@_ = reverse(@_);
ok(join(' ',@_), 'Z Y X W V U T S R Q P O N M L K J I H G F E D C B A', q{@_=reverse('A'..'Z')});

# [2] 1 test
# substitution
@_ = (qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z));
$_ = reverse(@_);
ok($_, 'ZYXWVUTSRQPONMLKJIHGFEDCBA', q{$_=reverse('A'..'Z')});

# [3] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
$_ = reverse($_);
ok($_, 'ZYXWVUTSRQPONMLKJIHGFEDCBA', q{$_=reverse('A..Z')});

# [4] 1 test
# substitution
$_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
@_ = reverse($_);
ok(join('',@_), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', q{@_=reverse('A..Z')});

# [5] 1 test
# substitution
@_ = (qw(ア イ ウ エ オ カ キ ク ケ コ サ シ ス セ ソ タ チ ツ テ ト));
@_ = reverse(@_);
ok(join(' ',@_), 'ト テ ツ チ タ ソ セ ス シ サ コ ケ ク キ カ オ エ ウ イ ア', q{@_=reverse('ア'..'ト')});

# [6] 1 test
# substitution
@_ = (qw(ア イ ウ エ オ カ キ ク ケ コ サ シ ス セ ソ タ チ ツ テ ト));
$_ = reverse(@_);
ok($_, 'トテツチタソセスシサコケクキカオエウイア', q{$_=reverse('ア'..'ト')});

# [7] 1 test
# substitution
$_ = 'アイウエオカキクケコサシスセソタチツテト';
$_ = reverse($_);
ok($_, 'トテツチタソセスシサコケクキカオエウイア', q{$_=reverse('ア..ト')});

# [8] 1 test
# substitution
$_ = 'アイウエオカキクケコサシスセソタチツテト';
@_ = reverse($_);
ok(join('',@_), 'アイウエオカキクケコサシスセソタチツテト', q{@_=reverse('ア..ト')});

__END__
