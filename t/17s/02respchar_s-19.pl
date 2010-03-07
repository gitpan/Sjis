use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a =~ s/(ア.{2})//) {
    if ($1 eq "アソソ") {
        print qq{ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 19 "アソソ" =~ s/(ア.{2})// \$1=($1) $^X $__FILE__\n};
}

__END__
