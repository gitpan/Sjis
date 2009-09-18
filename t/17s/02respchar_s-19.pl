use Sjis;

$a = "アソソ";
if ($a =~ s/(ア.{2})//) {
    if ($1 eq "アソソ") {
        print qq{ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1)\n};
    }
    else {
        print qq{not ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1)\n};
}

__END__
