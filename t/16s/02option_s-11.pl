use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[CK]/あいう/g) {
    if ($a eq "ABあいうDEFGHIJあいうLMNOPQRSTUVWXYZ") {
        print qq{ok - 11 \$a =~ s/[CK]/あいう/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11a \$a =~ s/[CK]/あいう/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11b \$a =~ s/[CK]/あいう/g ($a) $^X $__FILE__\n};
}

__END__
