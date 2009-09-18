use Sjis;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[C]/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤DEFGHIJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 7 \$a =~ s/[C]/‚ ‚¢‚¤/g ($a)\n};
    }
    else {
        print qq{not ok - 7a \$a =~ s/[C]/‚ ‚¢‚¤/g ($a)\n};
    }
}
else {
    print qq{not ok - 7b \$a =~ s/[C]/‚ ‚¢‚¤/g ($a)\n};
}

__END__
