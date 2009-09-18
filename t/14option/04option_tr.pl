use Sjis;

# tr///c
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ/さしすせそ/c) {
    print qq{ok - 1 \$a =~ tr/サシスセソ/さしすせそ/c ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ/さしすせそ/c ($a)\n};
}

# tr///d
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ//d) {
    print qq{ok - 1 \$a =~ tr/サシスセソ//d ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ//d ($a)\n};
}

# tr///s
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ/ナ/s) {
    print qq{ok - 1 \$a =~ tr/サシスセソ/ナ/s ($a)\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ/ナ/s ($a)\n};
}

__END__
