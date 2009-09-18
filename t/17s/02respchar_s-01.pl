use Sjis;

$a = "ソアア";
if ($a =~ s/^ソ//) {
    print qq{ok - 1 "ソアア" =~ s/^ソ//\n};
}
else {
    print qq{not ok - 1 "ソアア" =~ s/^ソ//\n};
}

__END__
