use Sjis;

my $__FILE__ = __FILE__;

$a = "アアソ";
if ($a =~ s/ソ$//) {
    print qq{ok - 3 "アアソ" =~ s/ソ\$// $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "アアソ" =~ s/ソ\$// $^X $__FILE__\n};
}

__END__
