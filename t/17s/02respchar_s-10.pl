use Sjis;

$a = "�A�\�\";
if ($a !~ s/(�C�\?)//) {
    print qq{ok - 10 "�A�\�\" !~ s/(�C�\?)// \$1=($1)\n};
}
else {
    print qq{not ok - 10 "�A�\�\" !~ s/(�C�\?)// \$1=($1)\n};
}

__END__
