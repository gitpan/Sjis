use Sjis;

my $__FILE__ = __FILE__;

# s///s
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/FG.HI/さしす/s) {
    if ($a eq "ABCDEさしすJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 3 \$a =~ s/FG.HI/さしす/s ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3a \$a =~ s/FG.HI/さしす/s ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 3b \$a =~ s/FG.HI/さしす/s ($a) $^X $__FILE__\n};
}

__END__
