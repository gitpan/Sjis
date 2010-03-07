use Sjis;

my $__FILE__ = __FILE__;

$a = "アソソ";
if ($a !~ s/(イソ?)//) {
    print qq{ok - 10 "アソソ" !~ s/(イソ?)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 10 "アソソ" !~ s/(イソ?)// \$1=($1) $^X $__FILE__\n};
}

__END__
