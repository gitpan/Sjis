use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[C]/あいう/g) {
    if ($a eq "ABあいうDEFGHIJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 7 \$a =~ s/[C]/あいう/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7a \$a =~ s/[C]/あいう/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7b \$a =~ s/[C]/あいう/g ($a) $^X $__FILE__\n};
}

__END__
