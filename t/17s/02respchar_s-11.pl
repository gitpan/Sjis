use Sjis;

$a = "�A�\�\";
if ($a =~ s/(�A�\�\?)//) {
    if ($1 eq "�A�\�\") {
        print qq{ok - 11 "�A�\�\" =~ s/(�A�\�\?)// \$1=($1)\n};
    }
    else {
        print qq{not ok - 11 "�A�\�\" =~ s/(�A�\�\?)// \$1=($1)\n};
    }
}
else {
    print qq{not ok - 11 "�A�\�\" =~ s/(�A�\�\?)// \$1=($1)\n};
}

__END__
