use Sjis;

my $__FILE__ = __FILE__;

$a = "アソア";
if ($a !~ s/(アイ|イウ)//) {
    print qq{ok - 8 "アソア" !~ s/(アイ|イウ)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 "アソア" !~ s/(アイ|イウ)// \$1=($1) $^X $__FILE__\n};
}

__END__
