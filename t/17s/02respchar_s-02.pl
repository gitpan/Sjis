use Sjis;

$a = "�A�\�A";
if ($a !~ s/^�\//) {
    print qq{ok - 2 "�A�\�A" !~ s/^�\//\n};
}
else {
    print qq{not ok - 2 "�A�\�A" !~ s/^�\//\n};
}

__END__
