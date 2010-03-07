use Sjis;

my $__FILE__ = __FILE__;

# m//i
if ("アイウエオ" !~ /a/i) {
    print qq{ok - 1 "アイウエオ" !~ /a/i $^X $__FILE__\n}
}
else {
    print qq{not ok - 1 "アイウエオ" !~ /a/i $^X $__FILE__\n}
}

# m//m
if ("サシスセ\nソタチツテト" =~ m/^ソ/m) {
    print qq{ok - 2 "サシスセ\\nソタチツテト" =~ m/^ソ/m $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "サシスセ\\nソタチツテト" =~ m/^ソ/m $^X $__FILE__\n};
}

if ("サシスセソ\nタチツテト" =~ m/ソ$/m) {
    print qq{ok - 3 "サシスセソ\\nタチツテト" =~ m/ソ\$/m $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "サシスセソ\\nタチツテト" =~ m/ソ\$/m $^X $__FILE__\n};
}

if ("サシスセ\nソ\nタチツテト" =~ m/^ソ$/m) {
    print qq{ok - 4 "サシスセ\\nソ\\nタチツテト" =~ m/^ソ\$/m $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 "サシスセ\\nソ\\nタチツテト" =~ m/^ソ\$/m $^X $__FILE__\n};
}

# m//o
@re = ("ソ","イ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" =~ m/\Q$re\E/o) {
        print qq{ok - 5 "ソアア" =~ m/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5 "ソアア" =~ m/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

@re = ("イ","ソ");
for $i (1 .. 2) {
    $re = shift @re;
    if ("ソアア" !~ m/\Q$re\E/o) {
        print qq{ok - 6 "ソアア" !~ m/\\Q\$re\\E/o $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 6 "ソアア" !~ m/\\Q\$re\\E/o $^X $__FILE__\n};
    }
}

# m//s
if ("ア\nソ" =~ m/ア.ソ/s) {
    print qq{ok - 7 "ア\\nソ" =~ m/ア.ソ/s $^X $__FILE__\n};
}
else {
    print qq{not ok - 7 "ア\\nソ" =~ m/ア.ソ/s $^X $__FILE__\n};
}

# m//x
if ("アソソ" =~ m/  ソ  /x) {
    print qq{ok - 8 "アソソ" =~ m/  ソ  /x $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 "アソソ" =~ m/  ソ  /x $^X $__FILE__\n};
}

__END__
