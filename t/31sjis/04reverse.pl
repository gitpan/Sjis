use Sjis qw(reverse);

@_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ');
if ("@_" eq "さしすせそ かきくけこ あいうえお") {
    print qq{ok - 1 \@_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ')\n};
}
else {
    print qq{not ok - 1 \@_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ')\n};
}

$_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ');
if ($_ eq "そせすしさこけくきかおえういあ") {
    print qq{ok - 1 \$_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ')\n};
}
else {
    print qq{not ok - 1 \$_ = reverse('あいうえお', 'かきくけこ', 'さしすせそ')\n};
}

