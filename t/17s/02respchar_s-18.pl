use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a !~ s/(イ.)//) {
    print qq{ok - 18 "アソソ" !~ s/(イ.)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 18 "アソソ" !~ s/(イ.)// \$1=($1) $^X $__FILE__\n};
}

__END__
