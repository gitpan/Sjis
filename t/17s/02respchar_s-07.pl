use Sjis;

$a = "�A�\�A";
if ($a =~ s/(�A�\|�C�\)/$1<$1>/) {
    if ($1 eq "�A�\") {
        print qq{ok - 7 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 7 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 7 "�A�\�A" =~ s/(�A�\|�C�\)// \$1=($1)\n};
}

__END__
