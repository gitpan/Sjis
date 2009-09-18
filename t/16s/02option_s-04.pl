use Sjis;

# s///m
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/^HI/‚½‚¿‚Â/m) {
    if ($a eq "ABCDEFG\n‚½‚¿‚ÂJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 4 \$a =~ s/^HI/‚½‚¿‚Â/m ($a)\n};
    }
    else {
        print qq{not ok - 4a \$a =~ s/^HI/‚½‚¿‚Â/m ($a)\n};
    }
}
else {
    print qq{not ok - 4b \$a =~ s/^HI/‚½‚¿‚Â/m ($a)\n};
}

__END__
