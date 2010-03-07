use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a !~ s/(イ.{2})//) {
    print qq{ok - 20 "アソソ" !~ s/(イ.{2})// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 20 "アソソ" !~ s/(イ.{2})// \$1=($1) $^X $__FILE__\n};
}

__END__
