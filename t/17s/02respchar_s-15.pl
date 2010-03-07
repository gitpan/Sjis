use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a =~ s/(アソ*)//) {
    if ($1 eq "アソソ") {
        print qq{ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 "アソソ" =~ s/(アソ*)// \$1=($1) $^X $__FILE__\n};
}

__END__
