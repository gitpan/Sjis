use Sjis;

$a = "アアソ";
if ($a =~ s/ソ$//) {
    print qq{ok - 3 "アアソ" =~ s/ソ\$//\n};
}
else {
    print qq{not ok - 3 "アアソ" =~ s/ソ\$//\n};
}

__END__
