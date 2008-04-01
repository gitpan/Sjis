use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     256     # [1]
    +256     # [2]
    +255*256 # [3]
    +255*256 # [4]
    ;

    plan tests => $tests;
}

use Sjis;

my %chr = ();
for my $octet (0x00 .. 0xFF) {
    $chr{$octet} = pack('C',$octet);
}
for my $octet1 (0x01 .. 0xFF) {
    for my $octet2 (0x00 .. 0xFF) {
        $chr{$octet1 * 0x100 + $octet2} = pack('CC',$octet1,$octet2);
    }
}

# [1] 256 tests
# make character from $_ is single octet
for (0x00 .. 0xFF) {
    ok(chr, $chr{$_}, "$_: chr is $chr{$_}");
}

# [2] 256 tests
# make character from $octet is single octet
for my $octet (0x00 .. 0xFF) {
    ok(chr($octet), $chr{$octet}, "chr($octet) is $chr{$octet}");
}

# [3] 255*256 tests
# make character from $_ is double octet
for my $octet1 (0x01 .. 0xFF) {
    for my $octet2 (0x00 .. 0xFF) {
        $_ = $octet1 * 0x100 + $octet2;
        ok(chr, $chr{$_}, "$_: chr is $chr{$_}");
    }
}

# [4] 255*256 tests
# make character from $double_octet is double octet
for my $octet1 (0x01 .. 0xFF) {
    for my $octet2 (0x00 .. 0xFF) {
        my $double_octet = $octet1 * 0x100 + $octet2;
        ok(chr($double_octet), $chr{$double_octet}, "chr($double_octet) is $chr{$double_octet}");
    }
}

__END__
