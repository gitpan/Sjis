use Sjis;

$a = "アソア";
if ($a =~ s/(アソ|イソ)/$1<$1>/) {
    if ($1 eq "アソ") {
        print qq{ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1)\n};
}

__END__
