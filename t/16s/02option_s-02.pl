use Sjis;

# s///x ●
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/ J K L /かきく/x) {
    if ($a eq "ABCDEFGHIかきくMNOPQRSTUVWXYZ") {
        print qq{ok - 2 \$a =~ s/ J K L /かきく/x ($a)\n};
    }
    else {
        print qq{not ok - 2a \$a =~ s/ J K L /かきく/x ($a)\n};
    }
}
else {
    print qq{not ok - 2b \$a =~ s/ J K L /かきく/x ($a)\n};
}

__END__
