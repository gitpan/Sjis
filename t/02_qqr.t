use strict;

open(SCRIPT,'>02_qqr.tt') || die "Can't open file: 02_qqr.tt\n";
binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     (0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1)*2 # [1]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1)*2   # [2]
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

    if (pack('C',$octet) =~ /^[\(\)\[\*\+\?>\$\@]$/) {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet);
# [%d] 1 test
# Q quote %02x
eval {
    $_ = qqr <<'END';
\%c
END
};
ok($@, '', q<eval {qqr '\x%02x'}; \$@ is ''>);
ok(ref($_), 'Regexp', q<ref(qqr '\x%02x') is 'Regexp'>);

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet);
# [%d] 1 test
# Q quote %02x
eval {
    $_ = qqr <<'END';
%c
END
};
ok($@, '', q<eval {qqr '\x%02x'}; \$@ is ''>);
ok(ref($_), 'Regexp', q<ref(qqr '\x%02x') is 'Regexp'>);

SCRIPT
    }
}

for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        printf(<<'SCRIPT',$testno++,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# Q quote %02x%02x
eval {
    $_ = qqr <<'END';
%c%c
END
};
ok($@, '', q<eval {qqr '\x%02x\x%02x'} \$@ is ''>);
ok(ref($_), 'Regexp', q<ref(qqr '\x%02x\x%02x') is 'Regexp'>);

SCRIPT
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 02_qqr.tt');
unlink('02_qqr.tt');

__END__
