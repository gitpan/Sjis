use Sjis;

# s///g
$a = "ABCDEFGHIJCLMNOPQRSTUVWXYZ";

if ($a =~ s/[CC]/あいう/g) {
    if ($a eq "ABあいうDEFGHIJあいうLMNOPQRSTUVWXYZ") {
        print qq{ok - 10 \$a =~ s/[CC]/あいう/g ($a)\n};
    }
    else {
        print qq{not ok - 10a \$a =~ s/[CC]/あいう/g ($a)\n};
    }
}
else {
    print qq{not ok - 10b \$a =~ s/[CC]/あいう/g ($a)\n};
}

__END__
