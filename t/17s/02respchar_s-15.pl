use Sjis;

$a = "アソソ";
if ($a =~ s/(アソ*)//) {
    if ($1 eq "アソソ") {
        print qq{ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1)\n};
}

__END__
