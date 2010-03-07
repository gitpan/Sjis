use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/CD|JK|UV/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤EFGHI‚ ‚¢‚¤LMNOPQRST‚ ‚¢‚¤WXYZ") {
        print qq{ok - 5 \$a =~ s/CD|JK|UV/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 5a \$a =~ s/CD|JK|UV/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5b \$a =~ s/CD|JK|UV/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
}

__END__
