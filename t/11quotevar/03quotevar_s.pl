use Sjis;

$a = "�\";
if ($a =~ s/^\Q$a\E$//) {
    print qq#ok - \$a =~ s/^\\Q\$a\\E\$//\n#;
}
else {
    print qq#not ok - \$a =~ s/^\\Q\$a\\E\$//\n#;
}

$a[0] = "�\";
if ($a[0] =~ s/^\Q$a[0]\E$//) {
    print qq#ok - \$a[0] =~ s/^\\Q\$a[0]\\E\$//\n#;
}
else {
    print qq#not ok - \$a[0] =~ s/^\\Q\$a[0]\\E\$//\n#;
}

$b = 1;
if ($a[$b] =~ s/^\Q$a[$b]\E$//) {
    print qq#ok - \$a[\$b] =~ s/^\\Q\$a[\$b]\\E\$//\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ s/^\\Q\$a[\$b]\\E\$//\n#;
}

$a{"�\"} = "�\";
if ($a{'�\'} =~ s/^\Q$a{'�\'}\E$//) {
    print qq#ok - \$a{'�\'} =~ s/^\\Q\$a{'�\'}\\E\$//\n#;
}
else {
    print qq#not ok - \$a{'�\'} =~ s/^\\Q\$a{'�\'}\\E\$//\n#;
}

$b = "�\";
if ($a{$b} =~ s/^\Q$a{$b}\E$//) {
    print qq#ok - \$a{\$b} =~ s/^\\Q\$a{\$b}\\E\$//\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ s/^\\Q\$a{\$b}\\E\$//\n#;
}

