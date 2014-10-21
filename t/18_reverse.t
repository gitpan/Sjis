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
@_ = (qw(�A �C �E �G �I �J �L �N �P �R �T �V �X �Z �\ �^ �` �c �e �g));
@_ = reverse(@_);
ok(join(' ',@_), '�g �e �c �` �^ �\ �Z �X �V �T �R �P �N �L �J �I �G �E �C �A', q{@_=reverse('�A'..'�g')});

# [6] 1 test
# substitution
@_ = (qw(�A �C �E �G �I �J �L �N �P �R �T �V �X �Z �\ �^ �` �c �e �g));
$_ = reverse(@_);
ok($_, '�g�e�c�`�^�\�Z�X�V�T�R�P�N�L�J�I�G�E�C�A', q{$_=reverse('�A'..'�g')});

# [7] 1 test
# substitution
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
$_ = reverse($_);
ok($_, '�g�e�c�`�^�\�Z�X�V�T�R�P�N�L�J�I�G�E�C�A', q{$_=reverse('�A..�g')});

# [8] 1 test
# substitution
$_ = '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g';
@_ = reverse($_);
ok(join('',@_), '�A�C�E�G�I�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g', q{@_=reverse('�A..�g')});

__END__
