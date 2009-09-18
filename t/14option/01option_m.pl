use Sjis;

# m//i
if ("アイウエオ" !~ /a/i) {
    print qq{ok - 1 "アイウエオ" !~ /a/i\n}
}
else {
    print qq{not ok - 1 "アイウエオ" !~ /a/i\n}
}

# m//m
if ("サシスセ\nソタチツテト" =~ m/^ソ/m) {
    print qq{ok - 2 "サシスセ\\nソタチツテト" =~ m/^ソ/m\n};
}
else {
    print qq{not ok - 2 "サシスセ\\nソタチツテト" =~ m/^ソ/m\n};
}

if ("サシスセソ\nタチツテト" =~ m/ソ$/m) {
    print qq{ok - 3 "サシスセソ\\nタチツテト" =~ m/ソ\$/m\n};
}
else {
    print qq{not ok - 3 "サシスセソ\\nタチツテト" =~ m/ソ\$/m\n};
}

if ("サシスセ\nソ\nタチツテト" =~ m/^ソ$/m) {
    print qq{ok - 4 "サシスセ\\nソ\\nタチツテト" =~ m/^ソ\$/m\n};
}
else {
    print qq{not ok - 4 "サシスセ\\nソ\\nタチツテト" =~ m/^ソ\$/m\n};
}

# m//o
@re = ("ソ","イ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" =~ m/\Q$re\E/o) {
        print qq{ok - 5 "ソアア" =~ m/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 5 "ソアア" =~ m/\\Q\$re\\E/o\n};
    }
}

@re = ("イ","ソ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" !~ m/\Q$re\E/o) {
        print qq{ok - 6 "ソアア" !~ m/\\Q\$re\\E/o\n};
    }
    else {
        print qq{not ok - 6 "ソアア" !~ m/\\Q\$re\\E/o\n};
    }
}

# m//s
if ("ア\nソ" =~ m/ア.ソ/s) {
    print qq{ok - 7 "ア\\nソ" =~ m/ア.ソ/s\n};
}
else {
    print qq{not ok - 7 "ア\\nソ" =~ m/ア.ソ/s\n};
}

# m//x
if ("アソソ" =~ m/  ソ  /x) {
    print qq{ok - 8 "アソソ" =~ m/  ソ  /x\n};
}
else {
    print qq{not ok - 8 "アソソ" =~ m/  ソ  /x\n};
}

__END__
