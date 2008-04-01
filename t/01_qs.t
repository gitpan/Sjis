use strict;

open(SCRIPT,'>01_qs.tt') || die "Can't open file: 01_qs.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1 # [1]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1) # [2]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    # if octet is " @
    if (($octet==0x22) or ($octet==0x40)) {
        printf(<<'SCRIPT',$testno++,qq{pack('C',$octet)},pack('C',$octet),qq{pack('C',$octet)},pack('C',$octet),qq{pack('C',$octet)});
# [%s] 1 test
# qs quote %s
$_ = qs <<'END';
%s
END
ok($_, %s, q{qs('%s') is %s});

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,"pack('C',$octet)",pack('C',$octet),"pack('C',$octet)",pack('C',$octet),"pack('C',$octet)");
# [%s] 1 test
# qs quote %s
$_ = qs <<'END';
%s
END
ok($_, %s, "qs('%s') is %s");

SCRIPT
    }
}
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        # if octet is " @
        if (($octet2==0x22) or ($octet2==0x40)) {
            printf(<<'SCRIPT',$testno++,qq{pack('CC',$octet1,$octet2)},pack('CC',$octet1,$octet2),qq{pack('CC',$octet1,$octet2)},pack('CC',$octet1,$octet2),qq{pack('CC',$octet1,$octet2)});
# [%s] 1 test
# qs quote %s
$_ = qs <<'END';
%s
END
ok($_, %s, q{qs('%s') is %s});

SCRIPT
        }
        else {
            printf(<<'SCRIPT',$testno++,"pack('CC',$octet1,$octet2)",pack('CC',$octet1,$octet2),"pack('CC',$octet1,$octet2)",pack('CC',$octet1,$octet2),"pack('CC',$octet1,$octet2)");
# [%s] 1 test
# qs quote %s
$_ = qs <<'END';
%s
END
ok($_, %s, "qs('%s') is %s");

SCRIPT
        }
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 01_qs.tt');
unlink('01_qs.tt');

__END__
