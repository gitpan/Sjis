use Sjis;

$a = "アソソ";
if ($a !~ s/(イソ+)//) {
    print qq{ok - 14 "アソソ" !~ s/(イソ+)// \$1=($1)\n};
}
else {
    print qq{not ok - 14 "アソソ" !~ s/(イソ+)// \$1=($1)\n};
}

__END__
