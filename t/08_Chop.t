use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     0xff-0xfd+1+0xdf-0xa0+1+0x80-0x00+1 # [1]
    +0xff-0xfd+1+0xdf-0xa0+1+0x80-0x00+1 # [2]
    +0xff-0xfd+1+0xdf-0xa0+1+0x80-0x00+1 # [3]
    +0xff-0xfd+1+0xdf-0xa0+1+0x80-0x00+1 # [4]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [5]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [6]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [7]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [8]
    ;

    plan tests => $tests;
}

use Sjis;

# [1] 256 tests
# chop $_ is single octet character
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $_ = pack('C',$octet);
    Chop;
    ok($_, '', pack('C',$octet).": Chop is ''");
}

# [2] 256 tests
# chop $char is single octet character
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    Chop($char);
    ok($char, '', "Chop(".pack('C',$octet).") is ''");
}

# [3] 256 tests
# chop $_ is two single octet characters
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $_ = pack('CC',$octet,$octet);
    Chop;
    ok($_, pack('C',$octet), pack('CC',$octet,$octet).": Chop is '".pack('C',$octet)."'");
}

# [4] 256 tests
# chop $char is two single octet characters
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('CC',$octet,$octet);
    Chop($char);
    ok($char, pack('C',$octet), "Chop(".pack('CC',$octet,$octet).") is '".pack('C',$octet)."'");
}


# [5] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# chop $_ is double octet character
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $_ = pack('CC',$octet1,$octet2);
        Chop;
        ok($_, '', pack('CC',$octet1,$octet2).": Chop is ''");
    }
}

# [6] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# chop $double_octet_char is double octet character
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $double_octet_char = pack('CC',$octet1,$octet2);
        Chop($double_octet_char);
        ok($double_octet_char, '', "Chop(".pack('CC',$octet1,$octet2).") is ''");
    }
}

# [7] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# chop $_ is two double octet characters
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $_ = pack('CCCC',$octet1,$octet2,$octet1,$octet2);
        Chop;
        ok($_, pack('CC',$octet1,$octet2), pack('CCCC',$octet1,$octet2,$octet1,$octet2).": Chop is '".pack('CC',$octet1,$octet2)."'");
    }
}

# [8] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# chop $double_octet_char is two double octet characters
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $double_octet_char = pack('CCCC',$octet1,$octet2,$octet1,$octet2);
        Chop($double_octet_char);
        ok($double_octet_char, pack('CC',$octet1,$octet2), "Chop(".pack('CCCC',$octet1,$octet2,$octet1,$octet2).") is '".pack('CC',$octet1,$octet2)."'");
    }
}

__END__
