use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "������������������������������";

if ($a =~ s/[����]/�A�C�E/g) {
    if ($a eq "���������A�C�E���������A�C�E����������") {
        print qq{ok - 12 \$a =~ s/[����]/�A�C�E/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 12a \$a =~ s/[����]/�A�C�E/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 12b \$a =~ s/[����]/�A�C�E/g ($a) $^X $__FILE__\n};
}

__END__
