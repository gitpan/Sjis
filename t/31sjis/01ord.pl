use Sjis;

if (Sjis::ord('‚ ') eq 0x82A0) {
    print qq{ok - 1 Sjis::ord('‚ ') eq 0x82A0\n};
}
else {
    print qq{not ok - 1 Sjis::ord('‚ ') eq 0x82A0\n};
}

$_ = '‚¢';
if (Sjis::ord eq 0x82A2) {
    print qq{ok - 1 \$_ = '‚¢'; Sjis::ord() eq 0x82A2\n};
}
else {
    print qq{not ok - 1 \$_ = '‚¢'; Sjis::ord() eq 0x82A2\n};
}

