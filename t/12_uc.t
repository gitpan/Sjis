use strict;
use Test;

my $tests;

BEGIN {

    $tests =

     26                                                                       # [1]
    +26                                                                       # [2]
    +(256-26)                                                                 # [3]
    +(256-26)                                                                 # [4]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256                                        # [5]
    +((0x9f-0x81+1)+(0xfc-0xe0+1))*256                                        # [6]
#   +(26*26)                                                                  # [7]
#   +(26*26)                                                                  # [8]
#   +(26*(256-26))                                                            # [9]
#   +(26*(256-26))                                                            # [10]
#   +26*((0x9f-0x81+1)+(0xfc-0xe0+1))*256                                     # [11]
#   +26*((0x9f-0x81+1)+(0xfc-0xe0+1))*256                                     # [12]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*26                                # [13]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*26                                # [14]
#   +((0x9f-0x81+1)+(0xfc-0xe0+1))*256*26                                     # [15]
#   +((0x9f-0x81+1)+(0xfc-0xe0+1))*256*26                                     # [16]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*(256-26)                          # [17]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*(256-26)                          # [18]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 # [19]
#   +(256-26-((0x9f-0x81+1)+(0xfc-0xe0+1)))*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 # [20]
#   +((0x9f-0x81+1)+(0xfc-0xe0+1))*256*(256-26)                               # [21]
#   +((0x9f-0x81+1)+(0xfc-0xe0+1))*256*(256-26)                               # [22]
    +1*256*((0x9f-0x81+1)+(0xfc-0xe0+1))*1                                    # [23]
    +1*256*((0x9f-0x81+1)+(0xfc-0xe0+1))*1                                    # [24]
    ;

    plan tests => $tests;
}

use Sjis;

my %uc = ();
@uc{qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)} =
    qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);

# [1] 26 tests
# must be lower case from $_
for (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    ok(uc, $uc{$_}, "$_: uc is $uc{$_}");
}

# [2] 26 tests
# must be lower case from @_
for my $char (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    ok(uc($char), $uc{$char}, "uc($char) is $uc{$char}");
}

# [3] 256-26 tests
# must not be lower case from $_
for my $octet (0x00 .. 0xFF) {
    $_ = pack('C',$octet);
    next if exists $uc{$_};
    ok(uc, $_, "$_: uc is $_");
}

# [4] 256-26 tests
# must not be lower case from @_
for my $octet (0x00 .. 0xFF) {
    my $char = pack('C',$octet);
    next if exists $uc{$char};
    ok(uc($char), $char, "uc($char) is $char");
}

# [5] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must not be lower case from $_
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        $_ = pack('CC',$octet1,$octet2);
        ok(uc, $_, "$_: uc is $_");
    }
}

# [6] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must not be lower case from @_
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $char = pack('CC',$octet1,$octet2);
        ok(uc($char), $char, "uc($char) is $char");
    }
}

goto NEXT;

# [7] 26*26 tests
# must be and must be lower case from $_
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
        $_ = $a . $b;
        ok(uc, $uc{$a}.$uc{$b}, "$_: uc is $uc{$a}$uc{$b}");
    }
}

# [8] 26*26 tests
# must be and must be lower case from @_
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
        my $char = $a . $b;
        ok(uc($char), $uc{$a}.$uc{$b}, "uc($char) is $uc{$a}$uc{$b}");
    }
}

# [9] 26*(256-26) tests
# must be and must not be lower case from $_ single octet
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $octet (0x00 .. 0xFF) {
        my $b = pack('C',$octet);
        next if exists $uc{$b};
        $_ = $a . $b;
        ok(uc, $uc{$a}.$b, "$_: uc is $uc{$a}$b");
    }
}

# [10] 26*(256-26) tests
# must be and must not be lower case from @_ single octet
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $octet (0x00 .. 0xFF) {
        my $b = pack('C',$octet);
        next if exists $uc{$b};
        my $char = $a . $b;
        ok(uc($char), $uc{$a}.$b, "uc($char) is $uc{$a}$b");
    }
}

# [11] 26*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must be and must not be lower case from $_ double octet
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
        for my $octet2 (0x00 .. 0xFF) {
            my $b = pack('CC',$octet1,$octet2);
            $_ = $a . $b;
            ok(uc, $uc{$a}.$b, "$_: uc is $uc{$a}$b");
        }
    }
}

# [12] 26*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must be and must not be lower case from @_ double octet
for my $a (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
    for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
        for my $octet2 (0x00 .. 0xFF) {
            my $b = pack('CC',$octet1,$octet2);
            my $char = $a . $b;
            ok(uc($char), $uc{$a}.$b, "uc($char) is $uc{$a}$b");
        }
    }
}

# [13] (256-26)*26 tests
# must not be and must be lower case from $_ single octet
for my $octet (0x00 .. 0xFF) {
    my $a = pack('C',$octet);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
        $_ = $a . $b;
        ok(uc, $a.$uc{$b}, "$_: uc is $a$uc{$b}");
    }
}

# [14] (256-26)*26 tests
# must not be and must be lower case from @_ single octet
for my $octet (0x00 .. 0xFF) {
    my $a = pack('C',$octet);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
        my $char = $a . $b;
        ok(uc($char), $a.$uc{$b}, "uc($char) is $a$uc{$b}");
    }
}

# [15] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256*26 tests
# must be and must not be lower case from $_ double octet
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet1,$octet2);
        for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
            $_ = $a . $b;
            ok(uc, $a.$uc{$b}, "$_: uc is $a$uc{$b}");
        }
    }
}

# [16] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256*26 tests
# must be and must not be lower case from @_ double octet
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet1,$octet2);
        for my $b (qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)) {
            my $char = $a . $b;
            ok(uc($char), $a.$uc{$b}, "uc($char) is $a$uc{$b}");
        }
    }
}

# [17] (256-26)*(256-26) tests
# must not be and must not be lower case from $_ single octet and single octet
for my $octet_a (0x00 .. 0xFF) {
    my $a = pack('C',$octet_a);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $octet_b (0x00 .. 0xFF) {
        my $b = pack('C',$octet_b);
        next if exists $uc{$b};
        $_ = $a . $b;
        ok(uc, $a.$b, "$_: uc is $a$b");
    }
}

# [18] (256-26)*(256-26) tests
# must not be and must not be lower case from @_ single octet and single octet
for my $octet_a (0x00 .. 0xFF) {
    my $a = pack('C',$octet_a);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $octet_b (0x00 .. 0xFF) {
        my $b = pack('C',$octet_b);
        next if exists $uc{$b};
        my $char = $a . $b;
        ok(uc($char), $a.$b, "uc($char) is $a$b");
    }
}

# [19] (256-26)*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must not be and must not be lower case from $_ single octet and double octet
for my $octet (0x00 .. 0xFF) {
    my $a = pack('C',$octet);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
        for my $octet2 (0x00 .. 0xFF) {
            my $b = pack('CC',$octet1,$octet2);
            $_ = $a . $b;
            ok(uc, $a.$b, "$_: uc is $a$b");
        }
    }
}

# [20] (256-26)*((0x9f-0x81+1)+(0xfc-0xe0+1))*256 tests
# must not be and must not be lower case from @_ single octet and double octet
for my $octet (0x00 .. 0xFF) {
    my $a = pack('C',$octet);
    next if exists $uc{$a};
    next if $a =~ /^[\x81-\x9F\xE0-\xFC]$/;
    for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
        for my $octet2 (0x00 .. 0xFF) {
            my $b = pack('CC',$octet1,$octet2);
            my $char = $a . $b;
            ok(uc($char), $a.$b, "uc($char) is $a$b");
        }
    }
}

# [21] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256*(256-26) tests
# must not be and must not be lower case from $_ double octet and single octet
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet1,$octet2);
        for my $octet (0x00 .. 0xFF) {
            my $b = pack('C',$octet);
            next if exists $uc{$b};
            $_ = $a . $b;
            ok(uc, $a.$b, "$_: uc is $a$b");
        }
    }
}

# [22] ((0x9f-0x81+1)+(0xfc-0xe0+1))*256*(256-26) tests
# must not be and must not be lower case from @_ double octet and single octet
for my $octet1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
    for my $octet2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet1,$octet2);
        for my $octet (0x00 .. 0xFF) {
            my $b = pack('C',$octet);
            next if exists $uc{$b};
            my $char = $a . $b;
            ok(uc($char), $a.$b, "uc($char) is $a$b");
        }
    }
}

NEXT:

# [23] 1*256*((0x9f-0x81+1)+(0xfc-0xe0+1))*1 tests
# must not be and must not be lower case from $_ double octet and double octet
for my $octet_a1 (0x81) {
    for my $octet_a2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet_a1,$octet_a2);
        for my $octet_b1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
            for my $octet_b2 (0x00) {
                my $b = pack('CC',$octet_b1,$octet_b2);
                $_ = $a . $b;
                ok(uc, $a.$b, "$_: uc is $a$b");
            }
        }
    }
}

# [24] 1*256*((0x9f-0x81+1)+(0xfc-0xe0+1))*1 tests
# must not be and must not be lower case from @_ double octet and double octet
for my $octet_a1 (0x81) {
    for my $octet_a2 (0x00 .. 0xFF) {
        my $a = pack('CC',$octet_a1,$octet_a2);
        for my $octet_b1 (0x81 .. 0x9F, 0xE0 .. 0xFC) {
            for my $octet_b2 (0x00) {
                my $b = pack('CC',$octet_b1,$octet_b2);
                my $char = $a . $b;
                ok(uc($char), $a.$b, "uc($char) is $a$b");
            }
        }
    }
}

__END__
