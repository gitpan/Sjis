use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "ABCDEFGHIJCLMNOPQRSTUVWXYZ";

if ($a =~ s/C/あいう/g) {
    if ($a eq "ABあいうDEFGHIJあいうLMNOPQRSTUVWXYZ") {
        print qq{ok - 8 \$a =~ s/C/あいう/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 8a \$a =~ s/C/あいう/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 8b \$a =~ s/C/あいう/g ($a) $^X $__FILE__\n};
}

__END__
