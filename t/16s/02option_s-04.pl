use Sjis;

# s///m
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/^HI/������/m) {
    if ($a eq "ABCDEFG\n������JKLMNOPQRSTUVWXYZ") {
        print qq{ok - 4 \$a =~ s/^HI/������/m ($a)\n};
    }
    else {
        print qq{not ok - 4a \$a =~ s/^HI/������/m ($a)\n};
    }
}
else {
    print qq{not ok - 4b \$a =~ s/^HI/������/m ($a)\n};
}

__END__
