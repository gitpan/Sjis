use Sjis;

# s///i
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/JkL/あいう/i) {
    if ($a eq "ABCDEFGHIあいうMNOPQRSTUVWXYZ") {
        print qq{ok - 1 \$a =~ s/JkL/あいう/i ($a)\n};
    }
    else {
        print qq{not ok - 1a \$a =~ s/JkL/あいう/i ($a)\n};
    }
}
else {
    print qq{not ok - 1b \$a =~ s/JkL/あいう/i ($a)\n};
}

__END__
