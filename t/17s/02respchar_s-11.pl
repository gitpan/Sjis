use Sjis;

$a = "アソソ";
if ($a =~ s/(アソソ?)//) {
    if ($1 eq "アソソ") {
        print qq{ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1)\n};
}

__END__
