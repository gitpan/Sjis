use Sjis;

$a = "�A�\�A";
if ($a =~ s/(�A([�C�\�E])�A)//) {
    if ($1 eq "�A�\�A") {
        if ($2 eq "�\") {
            print qq{ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2)\n};
        }
        else {
            print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2)\n};
        }
    }
    else {
        print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2)\n};
    }
}
else {
    print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2)\n};
}

__END__
