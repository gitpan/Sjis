use Sjis;

my $__FILE__ = __FILE__;

if (Sjis::ord('‚ ') eq 0x82A0) {
    print qq{ok - 1 Sjis::ord('‚ ') eq 0x82A0 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 Sjis::ord('‚ ') eq 0x82A0 $^X $__FILE__\n};
}

$_ = '‚¢';
if (Sjis::ord eq 0x82A2) {
    print qq{ok - 1 \$_ = '‚¢'; Sjis::ord() eq 0x82A2 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 \$_ = '‚¢'; Sjis::ord() eq 0x82A2 $^X $__FILE__\n};
}

