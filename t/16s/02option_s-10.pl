use Sjis;

# s///g
$a = "ABCDEFGHIJCLMNOPQRSTUVWXYZ";

if ($a =~ s/[CC]/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤DEFGHIJ‚ ‚¢‚¤LMNOPQRSTUVWXYZ") {
        print qq{ok - 10 \$a =~ s/[CC]/‚ ‚¢‚¤/g ($a)\n};
    }
    else {
        print qq{not ok - 10a \$a =~ s/[CC]/‚ ‚¢‚¤/g ($a)\n};
    }
}
else {
    print qq{not ok - 10b \$a =~ s/[CC]/‚ ‚¢‚¤/g ($a)\n};
}

__END__
