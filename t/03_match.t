use strict;

open(SCRIPT,'>03_match.tt') || die "Can't open file: 03_match.tt\n";
# binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1 # [1]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1) # [2]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1 # [3]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1) # [4]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1 # [5]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1) # [6]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1 # [7]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1) # [8]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;

# [1] $_ match single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
$_ = qs <<'END';
%c
END
ok(match(<<'END'), 1, q<'\x%02X': match('\x%02X') is 1>);
[\x%02X]
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
$_ = qs <<'END';
%c
END
ok(match(<<'END'), 1, q<'\x%02X': match('\x%02X') is 1>);
%c
END

SCRIPT
    }
}

# [2] $_ match double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        printf(<<'SCRIPT',$testno++,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c
END
ok(match(<<'END'), 1, q<'\x%02X\x%02X': match('\x%02X\x%02X') is 1>);
%c%c
END

SCRIPT
    }
}

# [3] $_ not match single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if ($octet == 0x41) {
        printf(<<'SCRIPT',$testno++,0x42,$octet,0x42,0x42,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
$_ = qs <<'END';
%c
END
ok(match(<<'END'), '', q<'\x%02X': match('\x%02X') is ''>);
[\x%02X]
END

SCRIPT
    }
    elsif (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
$_ = qs <<'END';
%c
END
ok(match(<<'END'), '', q<'\x%02X': match('\x%02X') is ''>);
[\x%02X]
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
$_ = qs <<'END';
%c
END
ok(match(<<'END'), '', q<'\x%02X': match('\x%02X') is ''>);
%c
END

SCRIPT
    }
}

# [4] $_ not match double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        if (($octet1 == 0x88) and ($octet2 == 0x9F)) {
            printf(<<'SCRIPT',$testno++,0x88,0xA0,$octet1,$octet2,0x88,0xA0,0x88,0xA0,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c
END
ok(match(<<'END'), '', q<'\x%02X\x%02X': match('\x%02X\x%02X') is ''>);
%c%c
END

SCRIPT
        }
        else {
            printf(<<'SCRIPT',$testno++,0x88,0x9F,$octet1,$octet2,0x88,0x9F,0x88,0x9F,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c
END
ok(match(<<'END'), '', q<'\x%02X\x%02X': match('\x%02X\x%02X') is ''>);
%c%c
END

SCRIPT
        }
    }
}

# [5] $string match single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
my $string = qs <<'END';
%c
END
ok(match($string,<<'END'), 1, q<match('\x%02X','\x%02X') is 1>);
[\x%02X]
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,$octet,$octet,$octet,$octet,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
my $string = qs <<'END';
%c
END
ok(match($string,<<'END'), 1, q<match('\x%02X','\x%02X') is 1>);
%c
END

SCRIPT
    }
}

# [6] $string match double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        printf(<<'SCRIPT',$testno++,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c
END
ok(match($string,<<'END'), 1, q<match('\x%02X\x%02X','\x%02X\x%02X') is 1>);
%c%c
END

SCRIPT
    }
}

# [7] $string not match single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if ($octet == 0x41) {
        printf(<<'SCRIPT',$testno++,0x42,$octet,0x42,0x42,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
my $string = qs <<'END';
%c
END
ok(match($string,<<'END'), '', q<match('\x%02X','\x%02X') is ''>);
[\x%02X]
END

SCRIPT
    }
    elsif (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
my $string = qs <<'END';
%c
END
ok(match($string,<<'END'), '', q<match('\x%02X','\x%02X') is ''>);
[\x%02X]
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,$octet,$octet);
# [%d] 1 test
# match %02X,%02X
my $string = qs <<'END';
%c
END
ok(match($string,<<'END'), '', q<match('\x%02X','\x%02X') is ''>);
%c
END

SCRIPT
    }
}

# [8] $string not match double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        if (($octet1 == 0x88) and ($octet2 == 0x9F)) {
            printf(<<'SCRIPT',$testno++,0x88,0xA0,$octet1,$octet2,0x88,0xA0,0x88,0xA0,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c
END
ok(match($string,<<'END'), '', q<match('\x%02X\x%02X','\x%02X\x%02X') is ''>);
%c%c
END

SCRIPT
        }
        else {
            printf(<<'SCRIPT',$testno++,0x88,0x9F,$octet1,$octet2,0x88,0x9F,0x88,0x9F,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# match %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c
END
ok(match($string,<<'END'), '', q<match('\x%02X\x%02X','\x%02X\x%02X') is ''>);
%c%c
END

SCRIPT
        }
    }
}

print <<'END';
__END__
END

close(SCRIPT);

# execute test script
system('perl 03_match.tt');
unlink('03_match.tt');

sub is_metachar($) {
    return 1 if $_[0] == 0x09; # HT
    return 1 if $_[0] == 0x0A; # LF
    return 1 if $_[0] == 0x0C; # FS
    return 1 if $_[0] == 0x20; # ' '
    return 1 if $_[0] == 0x23; # #
    return 1 if $_[0] == 0x24; # $
    return 1 if $_[0] == 0x25; # %
    return 1 if $_[0] == 0x28; # (
    return 1 if $_[0] == 0x29; # )
    return 1 if $_[0] == 0x2A; # *
    return 1 if $_[0] == 0x2B; # +
    return 1 if $_[0] == 0x2E; # .
    return 1 if $_[0] == 0x3E; # >
    return 1 if $_[0] == 0x3F; # ?
    return 1 if $_[0] == 0x40; # @
    return 1 if $_[0] == 0x5B; # [
    return 1 if $_[0] == 0x5C; # \
    return 1 if $_[0] == 0x5E; # ^
    return 1 if $_[0] == 0x7C; # |

    return 0;
}

__END__
