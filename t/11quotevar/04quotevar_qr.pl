use Sjis;

$a = "�\";
if ($a =~ qr/^\Q$a\E$/) {
    print qq#ok - \$a =~ qr/^\\Q\$a\\E\$/\n#;
}
else {
    print qq#not ok - \$a =~ qr/^\\Q\$a\\E\$/\n#;
}

$a[0] = "�\";
if ($a[0] =~ qr/^\Q$a[0]\E$/) {
    print qq#ok - \$a[0] =~ qr/^\\Q\$a[0]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[0] =~ qr/^\\Q\$a[0]\\E\$/\n#;
}

$b = 1;
if ($a[$b] =~ qr/^\Q$a[$b]\E$/) {
    print qq#ok - \$a[\$b] =~ qr/^\\Q\$a[\$b]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ qr/^\\Q\$a[\$b]\\E\$/\n#;
}

$a{"�\"} = "�\";
if ($a{'�\'} =~ qr/^\Q$a{'�\'}\E$/) {
    print qq#ok - \$a{'�\'} =~ qr/^\\Q\$a{'�\'}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{'�\'} =~ qr/^\\Q\$a{'�\'}\\E\$/\n#;
}

$b = "�\";
if ($a{$b} =~ qr/^\Q$a{$b}\E$/) {
    print qq#ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/\n#;
}

