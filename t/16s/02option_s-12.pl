use Sjis;

# s///g
$a = "あいうえおかきくけこさしすせそ";

if ($a =~ s/[おこ]/アイウ/g) {
    if ($a eq "あいうえアイウかきくけアイウさしすせそ") {
        print qq{ok - 12 \$a =~ s/[おこ]/アイウ/g ($a)\n};
    }
    else {
        print qq{not ok - 12a \$a =~ s/[おこ]/アイウ/g ($a)\n};
    }
}
else {
    print qq{not ok - 12b \$a =~ s/[おこ]/アイウ/g ($a)\n};
}

__END__
