use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�A�\";
if ($a =~ s/�\$//) {
    print qq{ok - 3 "�A�A�\" =~ s/�\\$// $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 "�A�A�\" =~ s/�\\$// $^X $__FILE__\n};
}

__END__
