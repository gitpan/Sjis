use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�A";
if ($a !~ s/(�A([�C�E�G])�A)//) {
    print qq{ok - 6 "�A�\�A" !~ s/(�A([�C�E�G])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
}
else {
    print qq{not ok - 6 "�A�\�A" !~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
}

__END__
