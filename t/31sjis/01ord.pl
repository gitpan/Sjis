use Sjis;

if (Sjis::ord('あ') eq 0x82A0) {
    print qq{ok - 1 Sjis::ord('あ') eq 0x82A0\n};
}
else {
    print qq{not ok - 1 Sjis::ord('あ') eq 0x82A0\n};
}

$_ = 'い';
if (Sjis::ord eq 0x82A2) {
    print qq{ok - 1 \$_ = 'い'; Sjis::ord() eq 0x82A2\n};
}
else {
    print qq{not ok - 1 \$_ = 'い'; Sjis::ord() eq 0x82A2\n};
}

