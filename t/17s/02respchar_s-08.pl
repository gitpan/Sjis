use Sjis;

$a = "�A�\�A";
if ($a !~ s/(�A�C|�C�E)//) {
    print qq{ok - 8 "�A�\�A" !~ s/(�A�C|�C�E)// \$1=($1)\n};
}
else {
    print qq{not ok - 8 "�A�\�A" !~ s/(�A�C|�C�E)// \$1=($1)\n};
}

__END__
