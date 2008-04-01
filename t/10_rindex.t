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
my %rindex = ();
my $rindex = 0;
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    $string .= pack('C',$octet);
    $rindex{pack('C',$octet)} = $rindex;
    $rindex += 1;
}
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $string .= pack('CC',$octet1,$octet2);
        $rindex{pack('CC',$octet1,$octet2)} = $rindex;
        $rindex += 2;
    }
}

# [1] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# rindex of single octet in $string
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    ok(rindex($string,$char), $rindex{$char}, "rindex(\$string,$char) is $rindex{$char}");
}

# [2] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# rindex of double octet in $string
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $char = pack('CC',$octet1,$octet2);
        ok(rindex($string,$char), $rindex{$char}, "rindex(\$string,$char) is $rindex{$char}");
    }
}

# [3] 256-((0x9f-0x81+1)+(0xfc-0xe0+1)) tests
# rindex of single octet in $string with start position
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {
    my $char = pack('C',$octet);
    ok(rindex($string.$string.$string,$char,length($string)*2-1), length($string)+$rindex{$char}, "rindex(\$string.\$string.\$string,$char,".length($string).") is " . (length($string)+$rindex{$char}));
}

# [4] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# rindex of double octet in $string with start position
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $char = pack('CC',$octet1,$octet2);
        ok(rindex($string.$string.$string,$char,length($string)*2-1), length($string)+$rindex{$char}, "rindex(\$string.\$string.\$string,$char,".length($string).") is " . (length($string)+$rindex{$char}));
    }
}

__END__
