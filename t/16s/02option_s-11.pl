use Sjis;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[CK]/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤DEFGHIJ‚ ‚¢‚¤LMNOPQRSTUVWXYZ") {
        print qq{ok - 11 \$a =~ s/[CK]/‚ ‚¢‚¤/g ($a)\n};
    }
    else {
        print qq{not ok - 11a \$a =~ s/[CK]/‚ ‚¢‚¤/g ($a)\n};
    }
}
else {
    print qq{not ok - 11b \$a =~ s/[CK]/‚ ‚¢‚¤/g ($a)\n};
}

__END__
