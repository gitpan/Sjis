use Sjis qw(ord);

my $__FILE__ = __FILE__;

if (ord('‚ ') eq 0x82A0) {
    print qq{ok - 1 ord('‚ ') eq 0x82A0 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 ord('‚ ') eq 0x82A0 $^X $__FILE__\n};
}

$_ = '‚¢';
if (ord eq 0x82A2) {
    print qq{ok - 1 \$_ = '‚¢'; ord eq 0x82A2 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$_ = '‚¢'; ord eq 0x82A2 $^X $__FILE__\n};
}

