use Sjis;

my $__FILE__ = __FILE__;

$a = "ソ";
if ($a =~ s/^\Q$a\E$//) {
    print qq#ok - \$a =~ s/^\\Q\$a\\E\$// $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a =~ s/^\\Q\$a\\E\$// $^X $__FILE__\n#;
}

$a[0] = "ソ";
if ($a[0] =~ s/^\Q$a[0]\E$//) {
    print qq#ok - \$a[0] =~ s/^\\Q\$a[0]\\E\$// $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a[0] =~ s/^\\Q\$a[0]\\E\$// $^X $__FILE__\n#;
}

$b = 1;
if ($a[$b] =~ s/^\Q$a[$b]\E$//) {
    print qq#ok - \$a[\$b] =~ s/^\\Q\$a[\$b]\\E\$// $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a[\$b] =~ s/^\\Q\$a[\$b]\\E\$// $^X $__FILE__\n#;
}

$a{"ソ"} = "表";
if ($a{'ソ'} =~ s/^\Q$a{'ソ'}\E$//) {
    print qq#ok - \$a{'ソ'} =~ s/^\\Q\$a{'ソ'}\\E\$// $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a{'ソ'} =~ s/^\\Q\$a{'ソ'}\\E\$// $^X $__FILE__\n#;
}

$b = "ソ";
if ($a{$b} =~ s/^\Q$a{$b}\E$//) {
    print qq#ok - \$a{\$b} =~ s/^\\Q\$a{\$b}\\E\$// $^X $__FILE__\n#;
}
else {
    print qq#not ok - \$a{\$b} =~ s/^\\Q\$a{\$b}\\E\$// $^X $__FILE__\n#;
}

