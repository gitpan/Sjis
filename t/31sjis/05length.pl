use Sjis;

if (length('あいうえお') == 10) {
    print qq{ok - 1 length('あいうえお') == 10\n};
}
else {
    print qq{not ok - 1 length('あいうえお') == 10\n};
}

if (Sjis::length('あいうえお') == 5) {
    print qq{ok - 2 Sjis::length('あいうえお') == 5\n};
}
else {
    print qq{not ok - 2 Sjis::length('あいうえお') == 5\n};
}

