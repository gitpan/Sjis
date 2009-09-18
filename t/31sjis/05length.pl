use Sjis;

if (length('‚ ‚¢‚¤‚¦‚¨') == 10) {
    print qq{ok - 1 length('‚ ‚¢‚¤‚¦‚¨') == 10\n};
}
else {
    print qq{not ok - 1 length('‚ ‚¢‚¤‚¦‚¨') == 10\n};
}

if (Sjis::length('‚ ‚¢‚¤‚¦‚¨') == 5) {
    print qq{ok - 2 Sjis::length('‚ ‚¢‚¤‚¦‚¨') == 5\n};
}
else {
    print qq{not ok - 2 Sjis::length('‚ ‚¢‚¤‚¦‚¨') == 5\n};
}

