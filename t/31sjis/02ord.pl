use Sjis qw(ord);

if (ord('あ') eq 0x82A0) {
    print qq{ok - 1 ord('あ') eq 0x82A0\n};
}
else {
    print qq{not ok - 1 ord('あ') eq 0x82A0\n};
}

$_ = 'い';
if (ord eq 0x82A2) {
    print qq{ok - 1 \$_ = 'い'; ord eq 0x82A2\n};
}
else {
    print qq{not ok - 1 \$_ = 'い'; ord eq 0x82A2\n};
}

