use Sjis;

$a = "�A�\�\";
if ($a !~ s/(�C.{2})//) {
    print qq{ok - 20 "�A�\�\" !~ s/(�C.{2})// \$1=($1)\n};
}
else {
    print qq{not ok - 20 "�A�\�\" !~ s/(�C.{2})// \$1=($1)\n};
}

__END__
