use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     0x100-((0x9f-0x81+1)+(0xfc-0xe0+1)) # [1]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1)) # [2]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [3]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [4]
    ;

    plan tests => $tests;
}

use Sjis;

my %ord = ();
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $ord{pack('C',$octet)} = $octet;
}
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $ord{pack('CC',$octet1,$octet2)} = $octet1 * 0x100 + $octet2;
    }
}

# [1] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# make character order from $_ is single octet character
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $_ = pack('C',$octet);
    ok(ord, $ord{$_}, "$_: ord is $ord{$_}");
}

# [2] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# make character order from $char is single octet character
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    ok(ord($char), $ord{$char}, "ord($char) is $ord{$char}");
}

# [3] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# make character order from $_ is double octet character
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $_ = pack('CC',$octet1,$octet2);
        ok(ord, $ord{$_}, "$_: ord is $ord{$_}");
    }
}

# [4] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# make character order from $double_octet_char is double octet character
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $double_octet_char = pack('CC',$octet1,$octet2);
        ok(ord($double_octet_char), $ord{$double_octet_char}, "ord($double_octet_char) is $ord{$double_octet_char}");
    }
}

__END__
