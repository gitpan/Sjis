use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a =~ s/(ア.)//) {
    if ($1 eq "アソ") {
        print qq{ok - 17 "アソソ" =~ s/(ア.)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 17 "アソソ" =~ s/(ア.)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 17 "アソソ" =~ s/(ア.)// \$1=($1) $^X $__FILE__\n};
}

__END__
