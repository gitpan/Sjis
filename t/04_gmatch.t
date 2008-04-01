use strict;

open(SCRIPT,'>04_gmatch.tt') || die "Can't open file: 04_gmatch.tt\n";
# binmode SCRIPT;
select SCRIPT;

print <<'SCRIPT';
use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     (0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1)*3 # [1]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1)*3   # [2]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1     # [3]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1)     # [4]
    +(0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1)*3 # [5]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1)*3   # [6]
    +0x100-((0x9f-0x81+1)+(0xfc-0xe0+1))-1-1     # [7]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*(256-1-1)     # [8]
    ;

    plan tests => $tests;
}

use Sjis;

SCRIPT

my $testno = 1;

# [1] $_ gmatch single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    my @octet = ();
    push(@octet, $octet) for(1..18);
    if (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X,%02X
$_ = qs <<'END';
%c%c%c
END
@_ = gmatch(<<'END');
([\x%02X])
END

ok($_[0], "\x%02X", q<'\x%02X': gmatch('\x%02X') 0 is '\x%02X'>);
ok($_[1], "\x%02X", q<'\x%02X': gmatch('\x%02X') 1 is '\x%02X'>);
ok($_[2], "\x%02X", q<'\x%02X': gmatch('\x%02X') 2 is '\x%02X'>);

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X,%02X
$_ = qs <<'END';
%c%c%c
END
@_ = gmatch(<<'END');
(%c)
END

ok($_[0], "\x%02X", q<'\x%02X': gmatch('\x%02X') 0 is '\x%02X'>);
ok($_[1], "\x%02X", q<'\x%02X': gmatch('\x%02X') 1 is '\x%02X'>);
ok($_[2], "\x%02X", q<'\x%02X': gmatch('\x%02X') 2 is '\x%02X'>);

SCRIPT
    }
}

# [2] $_ gmatch double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        my @octet = ();
        push(@octet, $octet1,$octet2) for(1..18);
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c%c%c%c%c
END
@_ = gmatch(<<'END');
(%c%c)
END

ok($_[0], "\x%02X\x%02X", q<'\x%02X\x%02X': gmatch('\x%02X\x%02X') 0 is '\x%02X\x%02X'>);
ok($_[1], "\x%02X\x%02X", q<'\x%02X\x%02X': gmatch('\x%02X\x%02X') 1 is '\x%02X\x%02X'>);
ok($_[2], "\x%02X\x%02X", q<'\x%02X\x%02X': gmatch('\x%02X\x%02X') 2 is '\x%02X\x%02X'>);

SCRIPT
    }
}

# [3] $_ not gmatch single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if ($octet == 0x41) {
        printf(<<'SCRIPT',$testno++,0x42,$octet,0x42,0x42,0x42,0x42,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
$_ = qs <<'END';
%c%c%c
END
ok(gmatch(<<'END'), '', q<'\x%02X': gmatch('\x%02X') is ''>);
([\x%02X])
END

SCRIPT
    }
    elsif (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,0x41,0x41,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
$_ = qs <<'END';
%c%c%c
END
ok(gmatch(<<'END'), '', q<'\x%02X': gmatch('\x%02X') is ''>);
([\x%02X])
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,0x41,0x41,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
$_ = qs <<'END';
%c%c%c
END
ok(gmatch(<<'END'), '', q<'\x%02X': gmatch('\x%02X') is ''>);
(%c)
END

SCRIPT
    }
}

# [4] $_ not gmatch double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        if (($octet1 == 0x88) and ($octet2 == 0x9F)) {
            printf(<<'SCRIPT',$testno++,0x88,0xA0,$octet1,$octet2,0x88,0xA0,0x88,0xA0,0x88,0xA0,0x88,0xA0,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c%c%c%c%c
END
ok(gmatch(<<'END'), '', q<'\x%02X\x%02X': gmatch('\x%02X\x%02X') is ''>);
(%c%c)
END

SCRIPT
        }
        else {
            printf(<<'SCRIPT',$testno++,0x88,0x9F,$octet1,$octet2,0x88,0x9F,0x88,0x9F,0x88,0x9F,0x88,0x9F,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
$_ = qs <<'END';
%c%c%c%c%c%c
END
ok(gmatch(<<'END'), '', q<'\x%02X\x%02X': gmatch('\x%02X\x%02X') is ''>);
(%c%c)
END

SCRIPT
        }
    }
}

# [5] $string gmatch single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    my @octet = ();
    push(@octet, $octet) for(1..18);
    if (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X,%02X
my $string = qs <<'END';
%c%c%c
END
@_ = gmatch($string,<<'END');
([\x%02X])
END

ok($_[0], "\x%02X", q<gmatch('\x%02X','\x%02X') 0 is '\x%02X'>);
ok($_[1], "\x%02X", q<gmatch('\x%02X','\x%02X') 1 is '\x%02X'>);
ok($_[2], "\x%02X", q<gmatch('\x%02X','\x%02X') 2 is '\x%02X'>);

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X,%02X
my $string = qs <<'END';
%c%c%c
END
@_ = gmatch($string,<<'END');
(%c)
END

ok($_[0], "\x%02X", q<gmatch('\x%02X','\x%02X') 0 is '\x%02X'>);
ok($_[1], "\x%02X", q<gmatch('\x%02X','\x%02X') 1 is '\x%02X'>);
ok($_[2], "\x%02X", q<gmatch('\x%02X','\x%02X') 2 is '\x%02X'>);

SCRIPT
    }
}

# [6] $string gmatch double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        my @octet = ();
        push(@octet, $octet1,$octet2) for(1..18);
        printf(<<'SCRIPT',$testno++,@octet);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c%c%c%c%c
END
@_ = gmatch($string,<<'END');
(%c%c)
END

ok($_[0], "\x%02X\x%02X", q<gmatch('\x%02X\x%02X','\x%02X\x%02X') 0 is '\x%02X\x%02X'>);
ok($_[1], "\x%02X\x%02X", q<gmatch('\x%02X\x%02X','\x%02X\x%02X') 1 is '\x%02X\x%02X'>);
ok($_[2], "\x%02X\x%02X", q<gmatch('\x%02X\x%02X','\x%02X\x%02X') 2 is '\x%02X\x%02X'>);

SCRIPT
    }
}

# [7] $string not gmatch single octet code
for my $octet (0x00 .. 0x80, 0xA0 .. 0xDF, 0xFD .. 0xFF) {

    # skip CR
    next if $octet == 0x0D;

    # skip EOF
    next if $octet == 0x1A;

    if ($octet == 0x41) {
        printf(<<'SCRIPT',$testno++,0x42,$octet,0x42,0x42,0x42,0x42,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
my $string = qs <<'END';
%c%c%c
END
ok(gmatch($string,<<'END'), '', q<gmatch('\x%02X','\x%02X') is ''>);
([\x%02X])
END

SCRIPT
    }
    elsif (&is_metachar($octet)) {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,0x41,0x41,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
my $string = qs <<'END';
%c%c%c
END
ok(gmatch($string,<<'END'), '', q<gmatch('\x%02X','\x%02X') is ''>);
([\x%02X])
END

SCRIPT
    }
    else {
        printf(<<'SCRIPT',$testno++,0x41,$octet,0x41,0x41,0x41,0x41,$octet,$octet);
# [%d] 1 test
# gmatch %02X,%02X
my $string = qs <<'END';
%c%c%c
END
ok(gmatch($string,<<'END'), '', q<gmatch('\x%02X','\x%02X') is ''>);
(%c)
END

SCRIPT
    }
}

# [8] $string not gmatch double octet code
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {

        # skip CR
        next if $octet2 == 0x0D;

        # skip EOF
        next if $octet2 == 0x1A;

        if (($octet1 == 0x88) and ($octet2 == 0x9F)) {
            printf(<<'SCRIPT',$testno++,0x88,0xA0,$octet1,$octet2,0x88,0xA0,0x88,0xA0,0x88,0xA0,0x88,0xA0,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c%c%c%c%c
END
ok(gmatch($string,<<'END'), '', q<gmatch('\x%02X\x%02X','\x%02X\x%02X') is ''>);
(%c%c)
END

SCRIPT
        }
        else {
            printf(<<'SCRIPT',$testno++,0x88,0x9F,$octet1,$octet2,0x88,0x9F,0x88,0x9F,0x88,0x9F,0x88,0x9F,$octet1,$octet2,$octet1,$octet2);
# [%d] 1 test
# gmatch %02X%02X,%02X%02X
my $string = qs <<'END';
%c%c%c%c%c%c
END
ok(gmatch($string,<<'END'), '', q<gmatch('\x%02X\x%02X','\x%02X\x%02X') is ''>);
(%c%c)
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
system('perl 04_gmatch.tt');
unlink('04_gmatch.tt');

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
