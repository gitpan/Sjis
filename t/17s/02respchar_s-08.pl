use Sjis;

$a = "アソア";
if ($a !~ s/(アイ|イウ)//) {
    print qq{ok - 8 "アソア" !~ s/(アイ|イウ)// \$1=($1)\n};
}
else {
    print qq{not ok - 8 "アソア" !~ s/(アイ|イウ)// \$1=($1)\n};
}

__END__
