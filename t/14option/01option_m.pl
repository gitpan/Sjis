use Sjis;

# m//i
if ("�A�C�E�G�I" !~ /a/i) {
    print qq{ok - 1 "�A�C�E�G�I" !~ /a/i\n}
}
else {
    print qq{not ok - 1 "�A�C�E�G�I" !~ /a/i\n}
}

# m//m
if ("�T�V�X�Z\n�\�^�`�c�e�g" =~ m/^�\/m) {
    print qq{ok - 2 "�T�V�X�Z\\n�\�^�`�c�e�g" =~ m/^�\/m\n};
}
else {
    print qq{not ok - 2 "�T�V�X�Z\\n�\�^�`�c�e�g" =~ m/^�\/m\n};
}

if ("�T�V�X�Z�\\n�^�`�c�e�g" =~ m/�\$/m) {
    print qq{ok - 3 "�T�V�X�Z�\\\n�^�`�c�e�g" =~ m/�\\$/m\n};
}
else {
    print qq{not ok - 3 "�T�V�X�Z�\\\n�^�`�c�e�g" =~ m/�\\$/m\n};
}

if ("�T�V�X�Z\n�\\n�^�`�c�e�g" =~ m/^�\$/m) {
    print qq{ok - 4 "�T�V�X�Z\\n�\\\n�^�`�c�e�g" =~ m/^�\\$/m\n};
}
else {
    print qq{not ok - 4 "�T�V�X�Z\\n�\\\n�^�`�c�e�g" =~ m/^�\\$/m\n};
}

# m//o
@re = ("�\","�C");
for $i (1 .. 2) {
    $re = shift @re;
    if ("�\�A�A" =~ m/\Q$re\E/o) {
        print qq{ok - 5 "�\�A�A" =~ m/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 5 "�\�A�A" =~ m/\\Q\$re\\E/o\n};
    }
}

@re = ("�C","�\");
for $i (1 .. 2) {
    $re = shift @re;
    if ("�\�A�A" !~ m/\Q$re\E/o) {
        print qq{ok - 6 "�\�A�A" !~ m/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 6 "�\�A�A" !~ m/\\Q\$re\\E/o\n};
    }
}

# m//s
if ("�A\n�\" =~ m/�A.�\/s) {
    print qq{ok - 7 "�A\\n�\" =~ m/�A.�\/s\n};
}
else {
    print qq{not ok - 7 "�A\\n�\" =~ m/�A.�\/s\n};
}

# m//x
if ("�A�\�\" =~ m/  �\  /x) {
    print qq{ok - 8 "�A�\�\" =~ m/  �\  /x\n};
}
else {
    print qq{not ok - 8 "�A�\�\" =~ m/  �\  /x\n};
}

__END__
