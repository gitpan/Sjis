use Sjis;

my $__FILE__ = __FILE__;

if ("�\�A�A" =~ qr/^�\/) {
    print qq{ok - "�\�A�A" =~ qr/^�\/ $^X $__FILE__\n};
}
else {
    print qq{not ok - "�\�A�A" =~ qr/^�\/ $^X $__FILE__\n};
}

if ("�A�\�A" !~ qr/^�\/) {
    print qq{ok - "�A�\�A" !~ qr/^�\/ $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�A" !~ qr/^�\/ $^X $__FILE__\n};
}

if ("�A�A�\" =~ qr/�\$/) {
    print qq{ok - "�A�A�\" =~ qr/�\\$/ $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�A�\" =~ qr/�\\$/ $^X $__FILE__\n};
}

if ("�A�\�A" !~ qr/�\$/) {
    print qq{ok - "�A�\�A" !~ qr/�\\$/ $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�A" !~ qr/�\\$/ $^X $__FILE__\n};
}

if ("�A�\�A" =~ qr/(�A([�C�\�E])�A)/) {
    if ($1 eq "�A�\�A") {
        if ($2 eq "�\") {
            print qq{ok - "�A�\�A" =~ qr/(�A([�C�\�E])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
        }
        else {
            print qq{not ok - "�A�\�A" =~ qr/(�A([�C�\�E])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - "�A�\�A" =~ qr/(�A([�C�\�E])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�A" =~ qr/(�A([�C�\�E])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
}

if ("�A�\�A" !~ qr/(�A([�C�E�G])�A)/) {
    print qq{ok - "�A�\�A" !~ qr/(�A([�C�E�G])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�A" !~ qr/(�A([�C�\�E])�A)/ \$1=($1), \$2=($2) $^X $__FILE__\n};
}

if ("�A�\�A" =~ qr/(�A�\|�C�\)/) {
    if ($1 eq "�A�\") {
        print qq{ok - "�A�\�A" =~ qr/(�A�\|�C�\)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�A" =~ qr/(�A�\|�C�\)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�A" =~ qr/(�A�\|�C�\)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�A" !~ qr/(�A�C|�C�E)/) {
    print qq{ok - "�A�\�A" !~ qr/(�A�C|�C�E)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�A" !~ qr/(�A�C|�C�E)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A�\?)/) {
    if ($1 eq "�A�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A�\?)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A�\?)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A�\?)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C�\?)/) {
    print qq{ok - "�A�\�\" !~ qr/(�C�\?)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C�\?)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A�\�\?)/) {
    if ($1 eq "�A�\�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A�\�\?)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A�\�\?)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A�\�\?)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C�\�\?)/) {
    print qq{ok - "�A�\�\" !~ qr/(�C�\�\?)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C�\�\?)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A�\+)/) {
    if ($1 eq "�A�\�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A�\+)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A�\+)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A�\+)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C�\+)/) {
    print qq{ok - "�A�\�\" !~ qr/(�C�\+)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C�\+)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A�\*)/) {
    if ($1 eq "�A�\�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A�\*)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A�\*)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A�\*)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C�\*)/) {
    print qq{ok - "�A�\�\" !~ qr/(�C�\*)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C�\*)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A.)/) {
    if ($1 eq "�A�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A.)/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A.)/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A.)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C.)/) {
    print qq{ok - "�A�\�\" !~ qr/(�C.)/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C.)/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" =~ qr/(�A.{2})/) {
    if ($1 eq "�A�\�\") {
        print qq{ok - "�A�\�\" =~ qr/(�A.{2})/ \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - "�A�\�\" =~ qr/(�A.{2})/ \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - "�A�\�\" =~ qr/(�A.{2})/ \$1=($1) $^X $__FILE__\n};
}

if ("�A�\�\" !~ qr/(�C.{2})/) {
    print qq{ok - "�A�\�\" !~ qr/(�C.{2})/ \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - "�A�\�\" !~ qr/(�C.{2})/ \$1=($1) $^X $__FILE__\n};
}

