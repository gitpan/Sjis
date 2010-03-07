use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a =~ s/(アソソ?)//) {
    if ($1 eq "アソソ") {
        print qq{ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 11 "アソソ" =~ s/(アソソ?)// \$1=($1) $^X $__FILE__\n};
}

__END__
