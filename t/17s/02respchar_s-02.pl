use Sjis;

$a = "アソア";
if ($a !~ s/^ソ//) {
    print qq{ok - 2 "アソア" !~ s/^ソ//\n};
}
else {
    print qq{not ok - 2 "アソア" !~ s/^ソ//\n};
}

__END__
