use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�A";
if ($a =~ s/(�A([�C�\�E])�A)//) {
    if ($1 eq "�A�\�A") {
        if ($2 eq "�\") {
            print qq{ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
        }
        else {
            print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 5 "�A�\�A" =~ s/(�A([�C�\�E])�A)// \$1=($1), \$2=($2) $^X $__FILE__\n};
}

__END__
