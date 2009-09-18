use Sjis;

$a = "アソソ";
if ($a =~ s/(アソ?)//) {
    if ($1 eq "アソ") {
        print qq{ok - 9 "アソソ" =~ s/(アソ?)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 9 "アソソ" =~ s/(アソ?)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 9 "アソソ" =~ s/(アソ?)// \$1=($1)\n};
}

__END__
