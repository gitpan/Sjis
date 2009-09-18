use Sjis;

$a = "アソア";
if ($a !~ s/ソ$//) {
    print qq{ok - 4 "アソア" !~ s/ソ\$//\n};
}
else {
    print qq{not ok - 4 "アソア" !~ s/ソ\$//\n};
}

__END__
