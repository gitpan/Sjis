use Sjis;

$text = '�h�n�D�r�x�r�F�Q�Q�T�T�T�W�F�X�T�|�P�O�|�O�R�F�|���|�����F����������������';

# 7.7 split���Z�q(���X�g�R���e�L�X�g)
@_ = split(/�F/, $text);
if (join('', map {"($_)"} @_) eq "(�h�n�D�r�x�r)(�Q�Q�T�T�T�W)(�X�T�|�P�O�|�O�R)(�|���|����)(����������������)") {
    print qq{ok - 1 \@_ = split(/�F/, \$text);\n};
}
else {
    print qq{not ok - 1 \@_ = split(/�F/, \$text);\n};
}

# 7.7 split���Z�q(�X�J���R���e�L�X�g)
$a = split(/�F/, $text);
if (join('', map {"($_)"} @_) eq "(�h�n�D�r�x�r)(�Q�Q�T�T�T�W)(�X�T�|�P�O�|�O�R)(�|���|����)(����������������)") {
    print qq{ok - 2 \$a = split(/�F/, \$text);\n};
}
else {
    print qq{not ok - 2 \$a = split(/�F/, \$text);\n};
}

# 7.7 split���Z�q(void�R���e�L�X�g)
split(/�F/, $text);
if (join('', map {"($_)"} @_) eq "(�h�n�D�r�x�r)(�Q�Q�T�T�T�W)(�X�T�|�P�O�|�O�R)(�|���|����)(����������������)") {
    print qq{ok - 3 (void) split(/�F/, \$text);\n};
}
else {
    print qq{not ok - 3 (void) split(/�F/, \$text);\n};
}

