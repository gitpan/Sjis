use Sjis;

# s///s
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/FG.HI/������/s) {
    if ($a eq "ABCDE������JKLMNOPQRSTUVWXYZ") {
        print qq{ok - 3 \$a =~ s/FG.HI/������/s ($a)\n};
    }
    else {
        print qq{not ok - 3a \$a =~ s/FG.HI/������/s ($a)\n};
    }
}
else {
    print qq{not ok - 3b \$a =~ s/FG.HI/������/s ($a)\n};
}

__END__
