use Sjis;

my $__FILE__ = __FILE__;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/[C]/‚ ‚¢‚¤/g) {
    if ($a eq "AB‚ ‚¢‚¤DEFGHIJKLMNOPQRSTUVWXYZ") {
        print qq{ok - 7 \$a =~ s/[C]/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7a \$a =~ s/[C]/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7b \$a =~ s/[C]/‚ ‚¢‚¤/g ($a) $^X $__FILE__\n};
}

__END__
