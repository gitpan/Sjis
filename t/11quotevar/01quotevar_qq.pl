use Sjis;

my $__FILE__ = __FILE__;

$a = "ソ";
if ("$a" eq $a) {
    print qq/ok - "\$a" eq \$a $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a" eq \$a $^X $__FILE__\n/;
}

$a[0] = "ソ";
if ("$a[0]" eq $a[0]) {
    print qq/ok - "\$a[0]" eq \$a[0] $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a[0]" eq \$a[0] $^X $__FILE__\n/;
}

$b = 1;
if ("$a[$b]" eq $a[$b]) {
    print qq/ok - "\$a[\$b]" eq \$a[\$b] $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a[\$b]" eq \$a[\$b] $^X $__FILE__\n/;
}

$a{"ソ"} = "表";
if ("$a{'ソ'}" eq $a{'ソ'}) {
    print qq/ok - "\$a{'ソ'}" eq \$a{'ソ'} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{'ソ'}" eq \$a{'ソ'} $^X $__FILE__\n/;
}

$b = "ソ";
if ("$a{$b}" eq $a{$b}) {
    print qq/ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}

#---

$a = "ソ";
if (qq{$a} eq $a) {
    print qq/ok - qq{\$a} eq \$a $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a" eq \$a $^X $__FILE__\n/;
}

$a[0] = "ソ";
if (qq{$a[0]} eq $a[0]) {
    print qq/ok - qq{\$a[0]} eq \$a[0] $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a[0]" eq \$a[0] $^X $__FILE__\n/;
}

$b = 1;
if (qq{$a[$b]} eq $a[$b]) {
    print qq/ok - qq{\$a[\$b]} eq \$a[\$b] $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a[\$b]" eq \$a[\$b] $^X $__FILE__\n/;
}

$a{"ソ"} = "表";
if (qq{$a{'ソ'}} eq $a{'ソ'}) {
    print qq/ok - qq{\$a{'ソ'}} eq \$a{'ソ'} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{'ソ'}" eq \$a{'ソ'} $^X $__FILE__\n/;
}

$b = "ソ";
if (qq{$a{$b}} eq $a{$b}) {
    print qq/ok - qq{\$a{\$b}} eq \$a{\$b} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}

