use Sjis;

$_ = 'あいうえおあいうえお';
if (index($_,'うえ') == 4) {
    print qq{ok - 1 index(\$_,'うえ') == 4\n};
}
else {
    print qq{not ok - 1 index(\$_,'うえ') == 4\n};
}

$_ = 'あいうえおあいうえお';
if (index($_,'うえ',6) == 14) {
    print qq{ok - 2 index(\$_,'うえ',6) == 14\n};
}
else {
    print qq{not ok - 2 index(\$_,'うえ',6) == 14\n};
}

$_ = 'あいうえおあいうえお';
if (Sjis::index($_,'うえ') == 2) {
    print qq{ok - 3 Sjis::index(\$_,'うえ') == 2\n};
}
else {
    print qq{not ok - 3 Sjis::index(\$_,'うえ') == 2\n};
}

$_ = 'あいうえおあいうえお';
if (Sjis::index($_,'うえ',3) == 7) {
    print qq{ok - 4 Sjis::index(\$_,'うえ',3) == 7\n};
}
else {
    print qq{not ok - 4 Sjis::index(\$_,'うえ',3) == 7\n};
}

