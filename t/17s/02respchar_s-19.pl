use Sjis;

$a = "�A�\�\";
if ($a =~ s/(�A.{2})//) {
    if ($1 eq "�A�\�\") {
        print qq{ok - 19 "�A�\�\" =~ s/(�A.{2})// \$1=($1)\n};
    }
    else {
        print qq{not ok - 19 "�A�\�\" =~ s/(�A.{2})// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 19 "�A�\�\" =~ s/(�A.{2})// \$1=($1)\n};
}

__END__
