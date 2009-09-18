use Sjis;

# s///i
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/JkL/‚ ‚¢‚¤/i) {
    if ($a eq "ABCDEFGHI‚ ‚¢‚¤MNOPQRSTUVWXYZ") {
        print qq{ok - 1 \$a =~ s/JkL/‚ ‚¢‚¤/i ($a)\n};
    }
    else {
        print qq{not ok - 1a \$a =~ s/JkL/‚ ‚¢‚¤/i ($a)\n};
    }
}
else {
    print qq{not ok - 1b \$a =~ s/JkL/‚ ‚¢‚¤/i ($a)\n};
}

__END__
