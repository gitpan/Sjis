use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�A";
if ($a !~ s/(�A�C|�C�E)//) {
    print qq{ok - 8 "�A�\�A" !~ s/(�A�C|�C�E)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 8 "�A�\�A" !~ s/(�A�C|�C�E)// \$1=($1) $^X $__FILE__\n};
}

__END__
