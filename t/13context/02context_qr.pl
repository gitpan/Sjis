use Sjis;

my $__FILE__ = __FILE__;

# /g �Ȃ��̃X�J���[�R���e�L�X�g
my $success = "�A�\�A" =~ qr/�\/;
if ($success) {
    print qq{ok - 1 "�A�\�A" =~ qr/�\/ $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "�A�\�A" =~ qr/�\/ $^X $__FILE__\n};
}

# /g �Ȃ��̃��X�g�R���e�L�X�g
if (my($c1,$c2,$c3,$c4) = "�T�V�X�Z�\�^�`�c�e�g" =~ qr/^...(.)(.)(.)(.)...$/) {
    if ("($c1)($c2)($c3)($c4)" eq "(�Z)(�\)(�^)(�`)") {
        print "ok - 2 ($c1)($c2)($c3)($c4) $^X $__FILE__\n";
    }
    else {
        print "not ok - 2 ($c1)($c2)($c3)($c4) $^X $__FILE__\n";
    }
}
else {
    print "not ok - 2 ($c1)($c2)($c3)($c4) $^X $__FILE__\n";
}

