use Sjis;

# s///s
$a = "ABCDEFG\nHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/FG.HI/‚³‚µ‚·/s) {
    if ($a eq "ABCDE‚³‚µ‚·JKLMNOPQRSTUVWXYZ") {
        print qq{ok - 3 \$a =~ s/FG.HI/‚³‚µ‚·/s ($a)\n};
    }
    else {
        print qq{not ok - 3a \$a =~ s/FG.HI/‚³‚µ‚·/s ($a)\n};
    }
}
else {
    print qq{not ok - 3b \$a =~ s/FG.HI/‚³‚µ‚·/s ($a)\n};
}

__END__
