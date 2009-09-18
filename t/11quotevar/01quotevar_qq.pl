use Sjis;

$a = "ソ";
if ("$a" eq $a) {
    print qq/ok - "\$a" eq \$a\n/;
}
else {
    print qq/not ok - "\$a" eq \$a\n/;
}

$a[0] = "ソ";
if ("$a[0]" eq $a[0]) {
    print qq/ok - "\$a[0]" eq \$a[0]\n/;
}
else {
    print qq/not ok - "\$a[0]" eq \$a[0]\n/;
}

$b = 1;
if ("$a[$b]" eq $a[$b]) {
    print qq/ok - "\$a[\$b]" eq \$a[\$b]\n/;
}
else {
    print qq/not ok - "\$a[\$b]" eq \$a[\$b]\n/;
}

$a{"ソ"} = "表";
if ("$a{'ソ'}" eq $a{'ソ'}) {
    print qq/ok - "\$a{'ソ'}" eq \$a{'ソ'}\n/;
}
else {
    print qq/not ok - "\$a{'ソ'}" eq \$a{'ソ'}\n/;
}

$b = "ソ";
if ("$a{$b}" eq $a{$b}) {
    print qq/ok - "\$a{\$b}" eq \$a{\$b}\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b}\n/;
}

#---

$a = "ソ";
if (qq{$a} eq $a) {
    print qq/ok - qq{\$a} eq \$a\n/;
}
else {
    print qq/not ok - "\$a" eq \$a\n/;
}

$a[0] = "ソ";
if (qq{$a[0]} eq $a[0]) {
    print qq/ok - qq{\$a[0]} eq \$a[0]\n/;
}
else {
    print qq/not ok - "\$a[0]" eq \$a[0]\n/;
}

$b = 1;
if (qq{$a[$b]} eq $a[$b]) {
    print qq/ok - qq{\$a[\$b]} eq \$a[\$b]\n/;
}
else {
    print qq/not ok - "\$a[\$b]" eq \$a[\$b]\n/;
}

$a{"ソ"} = "表";
if (qq{$a{'ソ'}} eq $a{'ソ'}) {
    print qq/ok - qq{\$a{'ソ'}} eq \$a{'ソ'}\n/;
}
else {
    print qq/not ok - "\$a{'ソ'}" eq \$a{'ソ'}\n/;
}

$b = "ソ";
if (qq{$a{$b}} eq $a{$b}) {
    print qq/ok - qq{\$a{\$b}} eq \$a{\$b}\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b}\n/;
}

