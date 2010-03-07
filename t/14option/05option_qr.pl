use Sjis;

my $__FILE__ = __FILE__;

# qr//i
if ("アイウエオ" !~ /a/i) {
    print qq{ok - 1 "アイウエオ" !~ /a/i $^X $__FILE__\n}
}
else {
    print qq{not ok - 1 "アイウエオ" !~ /a/i $^X $__FILE__\n}
}

# qr//m
if ("サシスセ\nソタチツテト" =~ qr/^ソ/m) {
    print qq{ok - 2 "サシスセ\\nソタチツテト" =~ qr/^ソ/m $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "サシスセ\\nソタチツテト" =~ qr/^ソ/m $^X $__FILE__\n};
}

# qr//o
@re = ("ソ","イ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" =~ qr/\Q$re\E/o) {
        print qq{ok - 3 "ソアア" =~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 3 "ソアア" =~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

@re = ("イ","ソ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" !~ qr/\Q$re\E/o) {
        print qq{ok - 4 "ソアア" !~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 4 "ソアア" !~ qr/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

# qr//s
if ("ア\nソ" =~ qr/ア.ソ/s) {
    print qq{ok - 5 "ア\\nソ" =~ qr/ア.ソ/s $^X $__FILE__\n};
}
else {
    print qq{not ok - 5 "ア\\nソ" =~ qr/ア.ソ/s $^X $__FILE__\n};
}

# qr//x
if ("アソソ" =~ qr/  ソ  /x) {
    print qq{ok - 6 "アソソ" =~ qr/  ソ  /x $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "アソソ" =~ qr/  ソ  /x $^X $__FILE__\n};
}

__END__
