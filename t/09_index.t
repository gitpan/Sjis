use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     0x100-((0x9f-0x81+1)+(0xfc-0xe0+1)) # [1]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [2]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1)) # [3]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256   # [4]
    ;

    plan tests => $tests;
}

use Sjis;

my $string = '';
my %index = ();
my $index = 0;
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $string .= pack('C',$octet);
    $index{pack('C',$octet)} = $index;
    $index += 1;
}
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $string .= pack('CC',$octet1,$octet2);
        $index{pack('CC',$octet1,$octet2)} = $index;
        $index += 2;
    }
}

# [1] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# index of single octet in $string
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    ok(Sjis::index($string,$char), $index{$char}, "Sjis::index(\$string,$char) is $index{$char}");
}

# [2] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# index of double octet in $string
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $char = pack('CC',$octet1,$octet2);
        ok(Sjis::index($string,$char), $index{$char}, "Sjis::index(\$string,$char) is $index{$char}");
    }
}

# [3] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# index of single octet in $string with start position
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    ok(Sjis::index($string.$string.$string,$char,length($string)), length($string)+$index{$char}, "Sjis::index(\$string.\$string.\$string,$char,".length($string).") is " . (length($string)+$index{$char}));
}

# [4] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# index of double octet in $string with start position
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $char = pack('CC',$octet1,$octet2);
        ok(Sjis::index($string.$string.$string,$char,length($string)), length($string)+$index{$char}, "Sjis::index(\$string.\$string.\$string,$char,".length($string).") is " . (length($string)+$index{$char}));
    }
}

__END__
