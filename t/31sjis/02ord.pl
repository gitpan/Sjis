use Sjis qw(ord);

if (ord('��') eq 0x82A0) {
    print qq{ok - 1 ord('��') eq 0x82A0\n};
}
else {
    print qq{not ok - 1 ord('��') eq 0x82A0\n};
}

$_ = '��';
if (ord eq 0x82A2) {
    print qq{ok - 1 \$_ = '��'; ord eq 0x82A2\n};
}
else {
    print qq{not ok - 1 \$_ = '��'; ord eq 0x82A2\n};
}
