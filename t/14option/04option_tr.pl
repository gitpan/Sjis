use Sjis;

my $__FILE__ = __FILE__;

# tr///c
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ/さしすせそ/c) {
    print qq{ok - 1 \$a =~ tr/サシスセソ/さしすせそ/c ($a) $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ/さしすせそ/c ($a) $^X $__FILE__\n};
}

# tr///d
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ//d) {
    print qq{ok - 1 \$a =~ tr/サシスセソ//d ($a) $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ//d ($a) $^X $__FILE__\n};
}

# tr///s
$a = "カキクケコサシスセソタチツテト";
if ($a =~ tr/サシスセソ/ナ/s) {
    print qq{ok - 1 \$a =~ tr/サシスセソ/ナ/s ($a) $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$a =~ tr/サシスセソ/ナ/s ($a) $^X $__FILE__\n};
}

__END__
