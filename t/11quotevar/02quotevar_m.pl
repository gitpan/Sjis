use Sjis;

$a = "�\";
if ($a =~ /^\Q$a\E$/) {
    print qq#ok - \$a =~ /^\\Q\$a\\E\$/\n#;
}
else {
    print qq#not ok - \$a =~ /^\\Q\$a\\E\$/\n#;
}

$a[0] = "�\";
if ($a[0] =~ /^\Q$a[0]\E$/) {
    print qq#ok - \$a[0] =~ /^\\Q\$a[0]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[0] =~ /^\\Q\$a[0]\\E\$/\n#;
}

$b = 1;
if ($a[$b] =~ /^\Q$a[$b]\E$/) {
    print qq#ok - \$a[\$b] =~ /^\\Q\$a[\$b]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ /^\\Q\$a[\$b]\\E\$/\n#;
}

$a{"�\"} = "�\";
if ($a{'�\'} =~ /^\Q$a{'�\'}\E$/) {
    print qq#ok - \$a{'�\'} =~ /^\\Q\$a{'�\'}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{'�\'} =~ /^\\Q\$a{'�\'}\\E\$/\n#;
}

$b = "�\";
if ($a{$b} =~ /^\Q$a{$b}\E$/) {
    print qq#ok - \$a{\$b} =~ /^\\Q\$a{\$b}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ /^\\Q\$a{\$b}\\E\$/\n#;
}

#---

$a = "�\";
if ($a =~ m/^\Q$a\E$/) {
    print qq#ok - \$a =~ m/^\\Q\$a\\E\$/\n#;
}
else {
    print qq#not ok - \$a =~ m/^\\Q\$a\\E\$/\n#;
}

$a[0] = "�\";
if ($a[0] =~ m/^\Q$a[0]\E$/) {
    print qq#ok - \$a[0] =~ m/^\\Q\$a[0]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[0] =~ m/^\\Q\$a[0]\\E\$/\n#;
}

$b = 1;
if ($a[$b] =~ m/^\Q$a[$b]\E$/) {
    print qq#ok - \$a[\$b] =~ m/^\\Q\$a[\$b]\\E\$/\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ m/^\\Q\$a[\$b]\\E\$/\n#;
}

$a{"�\"} = "�\";
if ($a{'�\'} =~ m/^\Q$a{'�\'}\E$/) {
    print qq#ok - \$a{'�\'} =~ m/^\\Q\$a{'�\'}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{'�\'} =~ m/^\\Q\$a{'�\'}\\E\$/\n#;
}

$b = "�\";
if ($a{$b} =~ m/^\Q$a{$b}\E$/) {
    print qq#ok - \$a{\$b} =~ m/^\\Q\$a{\$b}\\E\$/\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ m/^\\Q\$a{\$b}\\E\$/\n#;
}

