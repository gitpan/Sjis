use Sjis;

# /g �Ȃ��̃X�J���[�R���e�L�X�g
$success = "�A�\�A" =~ /�\/;
if ($success) {
    print qq{ok - 1 "�A�\�A" =~ /�\/\n};
}
else {
    print qq{not ok - 1 "�A�\�A" =~ /�\/\n};
}

# /g �Ȃ��̃��X�g�R���e�L�X�g
if (($c1,$c2,$c3,$c4) = "�T�V�X�Z�\�^�`�c�e�g" =~ /^...(.)(.)(.)(.)...$/) {
    if ("($c1)($c2)($c3)($c4)" eq "(�Z)(�\)(�^)(�`)") {
        print qq{ok - 2 "�T�V�X�Z�\�^�`�c�e�g" =~ /^...(.)(.)(.)(.)...\$/\n};
    }
    else {
        print qq{not ok - 2a "�T�V�X�Z�\�^�`�c�e�g" =~ /^...(.)(.)(.)(.)...\$/ ($c1)($c2)($c3)($c4)\n};
    }
}
else {
    print qq{not ok - 2b "�T�V�X�Z�\�^�`�c�e�g" =~ /^...(.)(.)(.)(.)...\$/ ($c1)($c2)($c3)($c4)\n};
}

# /g ����̃��X�g�R���e�L�X�g
@c = "�T�V�X�Z�\�^�`�c�e�g" =~ /./g;
if (@c) {
    $c = join '', map {"($_)"} @c;
    if ($c eq "(�T)(�V)(�X)(�Z)(�\)(�^)(�`)(�c)(�e)(�g)") {
        print qq{ok - 3 \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ /./g\n};
    }
    else {
        print qq{not ok - 3a \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ /./g\n};
    }
}
else {
    print qq{not ok - 3b \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ /./g\n};
}

# /g ����̃X�J���[�R���e�L�X�g
@c = ();
while ("�T�V�X�Z�\�^�`�c�e�g" =~ /(..)/g) {
    push @c, $1;
}
$c = join '', map {"($_)"} @c;
if ($c eq "(�T�V)(�X�Z)(�\�^)(�`�c)(�e�g)") {
    print qq{ok - 4 while ("�T�V�X�Z�\�^�`�c�e�g" =~ /(..)/g) { }\n};
}
else {
    print qq{not ok - 4 while ("�T�V�X�Z�\�^�`�c�e�g" =~ /(..)/g) { }\n};
}

#---

# /g �Ȃ��̃X�J���[�R���e�L�X�g
$success = "�A�\�A" =~ m/�\/;
if ($success) {
    print qq{ok - 5 "�A�\�A" =~ m/�\/\n};
}
else {
    print qq{not ok - 5 "�A�\�A" =~ m/�\/\n};
}

# /g �Ȃ��̃��X�g�R���e�L�X�g
if (($c1,$c2,$c3,$c4) = "�T�V�X�Z�\�^�`�c�e�g" =~ m/^...(.)(.)(.)(.)...$/) {
    if ("($c1)($c2)($c3)($c4)" eq "(�Z)(�\)(�^)(�`)") {
        print qq{ok - 6 "�T�V�X�Z�\�^�`�c�e�g" =~ m/^...(.)(.)(.)(.)...\$/\n};
    }
    else {
        print qq{not ok - 6a "�T�V�X�Z�\�^�`�c�e�g" =~ m/^...(.)(.)(.)(.)...\$/\n};
    }
}
else {
    print qq{not ok - 6b "�T�V�X�Z�\�^�`�c�e�g" =~ m/^...(.)(.)(.)(.)...\$/\n};
}

# /g ����̃��X�g�R���e�L�X�g
@c = "�T�V�X�Z�\�^�`�c�e�g" =~ m/./g;
if (@c) {
    $c = join '', map {"($_)"} @c;
    if ($c eq "(�T)(�V)(�X)(�Z)(�\)(�^)(�`)(�c)(�e)(�g)") {
        print qq{ok - 7 \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ m/./g\n};
    }
    else {
        print qq{not ok - 7a \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ m/./g\n};
    }
}
else {
    print qq{not ok - 7b \@c = "�T�V�X�Z�\�^�`�c�e�g" =~ m/./g\n};
}

# /g ����̃X�J���[�R���e�L�X�g
@c = ();
while ("�T�V�X�Z�\�^�`�c�e�g" =~ m/(..)/g) {
    push @c, $1;
}
$c = join '', map {"($_)"} @c;
if ($c eq "(�T�V)(�X�Z)(�\�^)(�`�c)(�e�g)") {
    print qq{ok - 8 while ("�T�V�X�Z�\�^�`�c�e�g" =~ m/(..)/g) { }\n};
}
else {
    print qq{not ok - 8 while ("�T�V�X�Z�\�^�`�c�e�g" =~ m/(..)/g) { }\n};
}

