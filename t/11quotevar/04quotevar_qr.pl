use Sjis;

my $__FILE__ = __FILE__;

$a = "�\";
if ($a =~ qr/^\Q$a\E$/) {
    print qq#ok - \$a =~ qr/^\\Q\$a\\E\$/ $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a =~ qr/^\\Q\$a\\E\$/ $^X $__FILE__\n#;
}

$a[0] = "�\";
if ($a[0] =~ qr/^\Q$a[0]\E$/) {
    print qq#ok - \$a[0] =~ qr/^\\Q\$a[0]\\E\$/ $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a[0] =~ qr/^\\Q\$a[0]\\E\$/ $^X $__FILE__\n#;
}

$b = 1;
if ($a[$b] =~ qr/^\Q$a[$b]\E$/) {
    print qq#ok - \$a[\$b] =~ qr/^\\Q\$a[\$b]\\E\$/ $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ qr/^\\Q\$a[\$b]\\E\$/ $^X $__FILE__\n#;
}

$a{"�\"} = "�\";
if ($a{'�\'} =~ qr/^\Q$a{'�\'}\E$/) {
    print qq#ok - \$a{'�\'} =~ qr/^\\Q\$a{'�\'}\\E\$/ $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a{'�\'} =~ qr/^\\Q\$a{'�\'}\\E\$/ $^X $__FILE__\n#;
}

$b = "�\";
if ($a{$b} =~ qr/^\Q$a{$b}\E$/) {
    print qq#ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/ $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/ $^X $__FILE__\n#;
}

