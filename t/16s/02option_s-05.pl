use Sjis;

# s///g
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if ($a =~ s/CD|JK|UV/あいう/g) {
    if ($a eq "ABあいうEFGHIあいうLMNOPQRSTあいうWXYZ") {
        print qq{ok - 5 \$a =~ s/CD|JK|UV/あいう/g ($a)\n};
    }
    else {
        print qq{not ok - 5a \$a =~ s/CD|JK|UV/あいう/g ($a)\n};
    }
}
else {
    print qq{not ok - 5b \$a =~ s/CD|JK|UV/あいう/g ($a)\n};
}

__END__
