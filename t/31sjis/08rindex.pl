use Sjis;

$_ = 'あいうえおあいうえお';
if (rindex($_,'いう') == 12) {
    print qq{ok - 1 rindex(\$_,'いう') == 12\n};
}
else {
    print qq{not ok - 1 rindex(\$_,'いう') == 12\n};
}

$_ = 'あいうえおあいうえお';
if (rindex($_,'いう',10) == 2) {
    print qq{ok - 2 rindex(\$_,'いう',10) == 2\n};
}
else {
    print qq{not ok - 2 rindex(\$_,'いう',10) == 2\n};
}

$_ = 'あいうえおあいうえお';
if (Sjis::rindex($_,'いう') == 6) {
    print qq{ok - 3 Sjis::rindex(\$_,'いう') == 6\n};
}
else {
    print qq{not ok - 3 Sjis::rindex(\$_,'いう') == 6\n};
}

$_ = 'あいうえおあいうえお';
if (Sjis::rindex($_,'いう',5) == 1) {
    print qq{ok - 4 Sjis::rindex(\$_,'いう',5) == 1\n};
}
else {
    print qq{not ok - 4 Sjis::rindex(\$_,'いう',5) == 1\n};
}

