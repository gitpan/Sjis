use Sjis;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[CK]/あいう/g) {
    if ($a eq "ABあいうDEFGHIJあいうLMNOPQRSTUVWXYZ") {
        print qq{ok - 11 \$a =~ s/[CK]/あいう/g ($a)\n};
    }
    else {
        print qq{not ok - 11a \$a =~ s/[CK]/あいう/g ($a)\n};
    }
}
else {
    print qq{not ok - 11b \$a =~ s/[CK]/あいう/g ($a)\n};
}

__END__
