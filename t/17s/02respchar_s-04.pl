use Sjis;

$a = "�A�\�A";
if ($a !~ s/�\$//) {
    print qq{ok - 4 "�A�\�A" !~ s/�\\$//\n};
}
else {
    print qq{not ok - 4 "�A�\�A" !~ s/�\\$//\n};
}

__END__
