use Sjis;

# s///m
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/^HI/たちつ/m) {
    if ($a eq "ABCDEFG\nたちつJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 4 \$a =~ s/^HI/たちつ/m ($a)\n};
    }
    else {
        print qq{not ok - 4a \$a =~ s/^HI/たちつ/m ($a)\n};
    }
}
else {
    print qq{not ok - 4b \$a =~ s/^HI/たちつ/m ($a)\n};
}

__END__
