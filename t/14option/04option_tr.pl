use Sjis;

# tr///c
$a = "�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g";
if ($a =~ tr/�T�V�X�Z�\/����������/c) {
    print qq{ok - 1 \$a =~ tr/�T�V�X�Z�\/����������/c ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/�T�V�X�Z�\/����������/c ($a)\n};
}

# tr///d
$a = "�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g";
if ($a =~ tr/�T�V�X�Z�\//d) {
    print qq{ok - 1 \$a =~ tr/�T�V�X�Z�\//d ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/�T�V�X�Z�\//d ($a)\n};
}

# tr///s
$a = "�J�L�N�P�R�T�V�X�Z�\�^�`�c�e�g";
if ($a =~ tr/�T�V�X�Z�\/�i/s) {
    print qq{ok - 1 \$a =~ tr/�T�V�X�Z�\/�i/s ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/�T�V�X�Z�\/�i/s ($a)\n};
}

__END__
