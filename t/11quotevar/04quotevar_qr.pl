use Sjis;

$a = "ソ";
if ($a =~ qr/^\Q$a\E$/) {
    print qq#ok - \$a =~ qr/^\\Q\$a\\E\$/\n#;
}
else {
    print qq#not ok - \$a =~ qr/^\\Q\$a\\E\$/\n#;
}

$a[0] = "ソ";
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

$a{"ソ"} = "表";
if ($a{'ソ'} =~ qr/^\Q$a{'ソ'}\E$/) {
    print qq#ok - \$a{'ソ'} =~ qr/^\\Q\$a{'ソ'}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{'ソ'} =~ qr/^\\Q\$a{'ソ'}\\E\$/\n#;
}

$b = "ソ";
if ($a{$b} =~ qr/^\Q$a{$b}\E$/) {
    print qq#ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ qr/^\\Q\$a{\$b}\\E\$/\n#;
}

