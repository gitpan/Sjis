use Sjis;

my $__FILE__ = __FILE__;

$a = "�\";
if ("$a" eq $a) {
    print qq/ok - "\$a" eq \$a $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a" eq \$a $^X $__FILE__\n/;
}

$a[0] = "�\";
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

$a{"�\"} = "�\";
if ("$a{'�\'}" eq $a{'�\'}) {
    print qq/ok - "\$a{'�\'}" eq \$a{'�\'} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{'�\'}" eq \$a{'�\'} $^X $__FILE__\n/;
}

$b = "�\";
if ("$a{$b}" eq $a{$b}) {
    print qq/ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}

#---

$a = "�\";
if (qq{$a} eq $a) {
    print qq/ok - qq{\$a} eq \$a $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a" eq \$a $^X $__FILE__\n/;
}

$a[0] = "�\";
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

$a{"�\"} = "�\";
if (qq{$a{'�\'}} eq $a{'�\'}) {
    print qq/ok - qq{\$a{'�\'}} eq \$a{'�\'} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{'�\'}" eq \$a{'�\'} $^X $__FILE__\n/;
}

$b = "�\";
if (qq{$a{$b}} eq $a{$b}) {
    print qq/ok - qq{\$a{\$b}} eq \$a{\$b} $^X $__FILE__\n/;
}
else {
    print qq/not ok - "\$a{\$b}" eq \$a{\$b} $^X $__FILE__\n/;
}

