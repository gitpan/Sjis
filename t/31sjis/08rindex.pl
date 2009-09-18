use Sjis;

$_ = '‚ ‚¢‚¤‚¦‚¨‚ ‚¢‚¤‚¦‚¨';
if (rindex($_,'‚¢‚¤') == 12) {
    print qq{ok - 1 rindex(\$_,'‚¢‚¤') == 12\n};
}
else {
    print qq{not ok - 1 rindex(\$_,'‚¢‚¤') == 12\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚ ‚¢‚¤‚¦‚¨';
if (rindex($_,'‚¢‚¤',10) == 2) {
    print qq{ok - 2 rindex(\$_,'‚¢‚¤',10) == 2\n};
}
else {
    print qq{not ok - 2 rindex(\$_,'‚¢‚¤',10) == 2\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚ ‚¢‚¤‚¦‚¨';
if (Sjis::rindex($_,'‚¢‚¤') == 6) {
    print qq{ok - 3 Sjis::rindex(\$_,'‚¢‚¤') == 6\n};
}
else {
    print qq{not ok - 3 Sjis::rindex(\$_,'‚¢‚¤') == 6\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚ ‚¢‚¤‚¦‚¨';
if (Sjis::rindex($_,'‚¢‚¤',5) == 1) {
    print qq{ok - 4 Sjis::rindex(\$_,'‚¢‚¤',5) == 1\n};
}
else {
    print qq{not ok - 4 Sjis::rindex(\$_,'‚¢‚¤',5) == 1\n};
}

