use Sjis;

my $__FILE__ = __FILE__;

$a = "アソア";
if ($a =~ s/(アソ|イソ)/$1<$1>/) {
    if ($1 eq "アソ") {
        print qq{ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 7 "アソア" =~ s/(アソ|イソ)// \$1=($1) $^X $__FILE__\n};
}

__END__
