use Sjis;

# s///g
$a = "������������������������������";

if ($a =~ s/[����]/�A�C�E/g) {
    if ($a eq "���������A�C�E���������A�C�E����������") {
        print qq{ok - 12 \$a =~ s/[����]/�A�C�E/g ($a)\n};
    }
    else {
        print qq{not ok - 12a \$a =~ s/[����]/�A�C�E/g ($a)\n};
    }
}
else {
    print qq{not ok - 12b \$a =~ s/[����]/�A�C�E/g ($a)\n};
}

__END__
