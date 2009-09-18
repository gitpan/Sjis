use Sjis;

# qr//i
if ("アイウエオ" !~ /a/i) {
    print qq{ok - 1 "アイウエオ" !~ /a/i\n}
}
else {
    print qq{not ok - 1 "アイウエオ" !~ /a/i\n}
}

# qr//m
if ("サシスセ\nソタチツテト" =~ qr/^ソ/m) {
    print qq{ok - 2 "サシスセ\\nソタチツテト" =~ qr/^ソ/m\n};
}
else {
    print qq{not ok - 2 "サシスセ\\nソタチツテト" =~ qr/^ソ/m\n};
}

# qr//o
@re = ("ソ","イ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" =~ qr/\Q$re\E/o) {
        print qq{ok - 3 "ソアア" =~ qr/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 3 "ソアア" =~ qr/\\Q\$re\\E/o\n};
    }
}

@re = ("イ","ソ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" !~ qr/\Q$re\E/o) {
        print qq{ok - 4 "ソアア" !~ qr/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 4 "ソアア" !~ qr/\\Q\$re\\E/o\n};
    }
}

# qr//s
if ("ア\nソ" =~ qr/ア.ソ/s) {
    print qq{ok - 5 "ア\\nソ" =~ qr/ア.ソ/s\n};
}
else {
    print qq{not ok - 5 "ア\\nソ" =~ qr/ア.ソ/s\n};
}

# qr//x
if ("アソソ" =~ qr/  ソ  /x) {
    print qq{ok - 6 "アソソ" =~ qr/  ソ  /x\n};
}
else {
    print qq{not ok - 6 "アソソ" =~ qr/  ソ  /x\n};
}

__END__
