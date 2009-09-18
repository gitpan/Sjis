use Sjis;

$a = "アソソ";
if ($a !~ s/(イ.)//) {
    print qq{ok - 18 "アソソ" !~ s/(イ.)// \$1=($1)\n};
}
else {
    print qq{not ok - 18 "アソソ" !~ s/(イ.)// \$1=($1)\n};
}

__END__
