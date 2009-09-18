use Sjis;

# s///g
$a = "ABCDEFGHIJCLMNOPQRSTUVWXYZ";

if ($a =~ s/C/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤DEFGHIJ‚ ‚¢‚¤LMNOPQRSTUVWXYZ") {
        print qq{ok - 8 \$a =~ s/C/‚ ‚¢‚¤/g ($a)\n};
    }
    else {
        print qq{not ok - 8a \$a =~ s/C/‚ ‚¢‚¤/g ($a)\n};
    }
}
else {
    print qq{not ok - 8b \$a =~ s/C/‚ ‚¢‚¤/g ($a)\n};
}

__END__
