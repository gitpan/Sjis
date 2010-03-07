use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a !~ s/(イソソ?)//) {
    print qq{ok - 12 "アソソ" !~ s/(イソソ?)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 12 "アソソ" !~ s/(イソソ?)// \$1=($1) $^X $__FILE__\n};
}

__END__
