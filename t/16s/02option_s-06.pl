use Sjis;

# s///e
$a = "あいうえおH41かきくけこ";
if ($a =~ s/H([0-9A-Fa-f]{2})/sprintf('[%c]',hex($1))/e) {
    if ($a eq "あいうえお[A]かきくけこ") {
        print qq{ok - 6 \$a =~ s/H([0-9A-Fa-f]{2})/sprintf('[%c]',hex(\$1))/e ($a)\n};
    }
    else {
        print qq{not ok - 6a \$a =~ s/H([0-9A-Fa-f]{2})/sprintf('[%c]',hex(\$1))/e ($a)\n};
    }
}
else {
    print qq{not ok - 6b \$a =~ s/H([0-9A-Fa-f]{2})/sprintf('[%c]',hex(\$1))/e ($a)\n};
}

__END__
