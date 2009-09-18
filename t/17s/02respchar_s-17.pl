use Sjis;

$a = "アソソ";
if ($a =~ s/(ア.)//) {
    if ($1 eq "アソ") {
        print qq{ok - 17 "アソソ" =~ s/(ア.)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 17 "アソソ" =~ s/(ア.)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 17 "アソソ" =~ s/(ア.)// \$1=($1)\n};
}

__END__
