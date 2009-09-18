use Sjis;

$a = "アソソ";
if ($a !~ s/(イソソ?)//) {
    print qq{ok - 12 "アソソ" !~ s/(イソソ?)// \$1=($1)\n};
}
else {
    print qq{not ok - 12 "アソソ" !~ s/(イソソ?)// \$1=($1)\n};
}

__END__
