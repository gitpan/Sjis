use Sjis;

$a = "アソソ";
if ($a !~ s/(イ.{2})//) {
    print qq{ok - 20 "アソソ" !~ s/(イ.{2})// \$1=($1)\n};
}
else {
    print qq{not ok - 20 "アソソ" !~ s/(イ.{2})// \$1=($1)\n};
}

__END__
