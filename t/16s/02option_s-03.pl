use Sjis;

# s///s
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/FG.HI/さしす/s) {
    if ($a eq "ABCDEさしすJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 3 \$a =~ s/FG.HI/さしす/s ($a)\n};
    }
    else {
        print qq{not ok - 3a \$a =~ s/FG.HI/さしす/s ($a)\n};
    }
}
else {
    print qq{not ok - 3b \$a =~ s/FG.HI/さしす/s ($a)\n};
}

__END__
