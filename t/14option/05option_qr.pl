use Sjis;

my $__FILE__ = __FILE__;

# qr//i
if ("�A�C�E�G�I" !~ /a/i) {
    print qq{ok - 1 "�A�C�E�G�I" !~ /a/i $^X $__FILE__\n}
}
else {
    print qq{not ok - 1 "�A�C�E�G�I" !~ /a/i $^X $__FILE__\n}
}

# qr//m
if ("�T�V�X�Z\n�\�^�`�c�e�g" =~ qr/^�\/m) {
    print qq{ok - 2 "�T�V�X�Z\\n�\�^�`�c�e�g" =~ qr/^�\/m $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "�T�V�X�Z\\n�\�^�`�c�e�g" =~ qr/^�\/m $^X $__FILE__\n};
}

# qr//o
@re = ("�\","�C");
for $i (1 .. 2) {
    $re = shift @re;
    if ("�\�A�A" =~ qr/\Q$re\E/o) {
        print qq{ok - 3 "�\�A�A" =~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 "�\�A�A" =~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

@re = ("�C","�\");
for $i (1 .. 2) {
    $re = shift @re;
    if ("�\�A�A" !~ qr/\Q$re\E/o) {
        print qq{ok - 4 "�\�A�A" !~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 "�\�A�A" !~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

# qr//s
if ("�A\n�\" =~ qr/�A.�\/s) {
    print qq{ok - 5 "�A\\n�\" =~ qr/�A.�\/s $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 "�A\\n�\" =~ qr/�A.�\/s $^X $__FILE__\n};
}

# qr//x
if ("�A�\�\" =~ qr/  �\  /x) {
    print qq{ok - 6 "�A�\�\" =~ qr/  �\  /x $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "�A�\�\" =~ qr/  �\  /x $^X $__FILE__\n};
}

__END__
