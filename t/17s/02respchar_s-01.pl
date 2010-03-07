use Sjis;

my $__FILE__ = __FILE__;

$a = "ソアア";
if ($a =~ s/^ソ//) {
    print qq{ok - 1 "ソアア" =~ s/^ソ// $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 "ソアア" =~ s/^ソ// $^X $__FILE__\n};
}

__END__
