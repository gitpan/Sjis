use Sjis;

my $__FILE__ = __FILE__;

$a = "アソア";
if ($a !~ s/^ソ//) {
    print qq{ok - 2 "アソア" !~ s/^ソ// $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 "アソア" !~ s/^ソ// $^X $__FILE__\n};
}

__END__
