package Esjis;
######################################################################
#
# Esjis - Run-time routines for esjis.pl
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION $_warning);

$VERSION = sprintf '%d.%02d', q$Revision: 0.17 $ =~ m/(\d+)/xmsg;

use Carp qw(carp croak confess cluck verbose);
use constant DEBUG => 1;
local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
$_warning = $^W; # push warning, warning on
local $^W = 1;

BEGIN {
    if ($^X =~ m/jperl/xmsi) {
        croak "Esjis: need perl(not jperl) 5.00503 or later. (\$^X==$^X)";
    }
}

sub import() {}
sub unimport() {}

#
# ShiftJIS split
#
sub Esjis::split(;$$$) {

    if (@_ == 0) {
        return CORE::split;
    }
    elsif (@_ == 1) {
        if ($_[0] eq '') {
            if (wantarray) {
                return      m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
            }
            else {
                cluck 'Use of implicit split to @_ is deprecated' if $^W;
                return @_ = m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
            }
        }
        else {
            return CORE::split $_[0];
        }
    }
    elsif (@_ == 2) {
        if ($_[0] eq '') {
            if (wantarray) {
                return      $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
            }
            else {
                cluck 'Use of implicit split to @_ is deprecated' if $^W;
                return @_ = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
            }
        }
        else {
            return CORE::split $_[0], $_[1];
        }
    }
    elsif (@_ == 3) {
        if ($_[0] eq '') {
            if ($_[2] == 0) {
                if (wantarray) {
                    return      $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
                }
                else {
                    cluck 'Use of implicit split to @_ is deprecated' if $^W;
                    return @_ = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
                }
            }
            elsif ($_[2] == 1) {
                return $_[1];
            }
            else {
                my @split = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/oxmsg;
                if (scalar(@split) < $_[2]) {
                    if (wantarray) {
                        return      @split, '';
                    }
                    else {
                        cluck 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @split, '';
                    }
                }
                elsif (scalar(@split) == $_[2]) {
                    if (wantarray) {
                        return      @split;
                    }
                    else {
                        cluck 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @split;
                    }
                }
                else {
                    if (wantarray) {
                        return      @split[0..$_[2]-2], join '', @split[$_[2]-1..$#split];
                    }
                    else {
                        cluck 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @split[0..$_[2]-2], join '', @split[$_[2]-1..$#split];
                    }
                }
            }
        }
        else {
            return CORE::split $_[0], $_[1], $_[2];
        }
    }
}

#
# ShiftJIS transliteration (tr///)
#
sub Esjis::tr($$$;$) {

    my @char            = $_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg;
    my $searchlist      = $_[1];
    my $replacementlist = $_[2];
    my $opt             = $_[3] || '';

    my @searchlist = &_charlist_tr($searchlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])
    )}oxmsg);

    my @replacementlist = &_charlist_tr($replacementlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])
    )}oxmsg);

    my %tr = ();
    for (my $i=0; $i <= $#searchlist; $i++) {
        if (not exists $tr{$searchlist[$i]}) {
            if (defined $replacementlist[$i] and ($replacementlist[$i] ne '')) {
                $tr{$searchlist[$i]} = $replacementlist[$i];
            }
            elsif ($opt =~ m/d/oxms) {
                $tr{$searchlist[$i]} = '';
            }
            elsif (defined $replacementlist[-1] and ($replacementlist[-1] ne '')) {
                $tr{$searchlist[$i]} = $replacementlist[-1];
            }
            else {
                $tr{$searchlist[$i]} = $searchlist[$i];
            }
        }
    }

    my $tr = 0;
    $_[0] = '';
    if ($opt =~ m/c/oxms) {
        while (defined(my $char = shift @char)) {
            if (not exists $tr{$char}) {
                if (defined $replacementlist[0]) {
                    $_[0] .= $replacementlist[0];
                }
                $tr++;
                if ($opt =~ m/s/oxms) {
                    while (@char and (not exists $tr{$char[0]})) {
                        shift @char;
                        $tr++;
                    }
                }
            }
            else {
                $_[0] .= $char;
            }
        }
    }
    else {
        while (defined(my $char = shift @char)) {
            if (exists $tr{$char}) {
                $_[0] .= $tr{$char};
                $tr++;
                if ($opt =~ m/s/oxms) {
                    while (@char and (exists $tr{$char[0]}) and ($tr{$char[0]} eq $tr{$char})) {
                        shift @char;
                        $tr++;
                    }
                }
            }
            else {
                $_[0] .= $char;
            }
        }
    }
    return $tr;
}

#
# ShiftJIS chop
#
sub Esjis::chop(;@) {

    my $chop;
    if (@_ == 0) {
        my @char = m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])/oxmsg;
        $chop = pop @char;
        $_ = join '', @char;
    }
    else {
        for my $string (@_) {
            my @char = $string =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg;
            $chop = pop @char;
            $string = join '', @char;
        }
    }
    return $chop;
}

#
# ShiftJIS index
#
sub Esjis::index($$;$) {

    my($str,$substr,$position) = @_;
    $position ||= 0;
    my $pos = 0;

    while ($pos < length($str)) {
        if (substr($str,$pos,length($substr)) eq $substr) {
            if ($pos >= $position) {
                return $pos;
            }
        }
        if (substr($str,$pos,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
            $pos += 2;
        }
        else {
            $pos += 1;
        }
    }
    return -1;
}

#
# ShiftJIS reverse index
#
sub Esjis::rindex($$;$) {

    my($str,$substr,$position) = @_;
    $position ||= length($str) - 1;
    my $pos = 0;
    my $rindex = -1;

    while (($pos < length($str)) and ($pos <= $position)) {
        if (substr($str,$pos,length($substr)) eq $substr) {
            $rindex = $pos;
        }
        if (substr($str,$pos,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
            $pos += 2;
        }
        else {
            $pos += 1;
        }
    }
    return $rindex;
}

#
# ShiftJIS lower case (lc)
#
sub Esjis::lc(;@) {

    my %lc = ();
    @lc{qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)} =
        qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);

    if (@_ == 0) {
        local $^W = 0;
        return join '', map {$lc{$_}||$_} m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])/oxmsg;
    }
    elsif (@_ == 1) {
        local $^W = 0;
        return join '', map {$lc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])/oxmsg);
    }
    else {
        local $^W = 0;
        return join('', map {$lc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])/oxmsg)), @_[1..$#_];
    }
}

#
# ShiftJIS upper case (uc)
#
sub Esjis::uc(;@) {

    my %uc = ();
    @uc{qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)} =
        qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);

    if (@_ == 0) {
        local $^W = 0;
        return join '', map {$uc{$_}||$_} m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg;
    }
    elsif (@_ == 1) {
        local $^W = 0;
        return join '', map {$uc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg);
    }
    else {
        local $^W = 0;
        return join('', map {$uc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg)), @_[1..$#_];
    }
}

#
# ShiftJIS regexp ignore case option
#
sub Esjis::ignorecase(@) {

    my @string = @_;
    my $metachar = qr/[\@\\|[\]{]/oxms;

    # ignore case of $scalar or @array
    for my $string (@string) {

        # split regexp
        my @char = $string =~ m{\G(
            \[\^ |
                (?:[\\\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\\\x81-\x9F\xE0-\xFC])
        )}oxmsg;

        # unescape character
        for (my $i=0; $i <= $#char; $i++) {
            next if not defined $char[$i];

            # open character class [...]
            if ($char[$i] eq '[') {
                my $left = $i;
                while (1) {
                    if (++$i > $#char) {
                        confess 'esjis: ' . join('',@char[$left..$#char]) . ' unmatched [] in regexp';
                    }
                    if ($char[$i] eq ']') {
                        my $right = $i;
                        my @charlist = &charlist_qr(@char[$left+1..$right-1], 'i');

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar) \z/oxms) {
                               $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/oxms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                        last;
                    }
                }
            }

            # open character class [^...]
            elsif ($char[$i] eq '[^') {
                my $left = $i;
                while (1) {
                    if (++$i > $#char) {
                        confess 'esjis: ' . join('',@char[$left..$#char]) . ' unmatched [] in regexp';
                    }
                    if ($char[$i] eq ']') {
                        my $right = $i;
                        my @charlist = &charlist_not_qr(@char[$left+1..$right-1], 'i');

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar) \z/oxms) {
                                $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/oxms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [^...]
                        splice(@char, $left, $right-$left+1,
                            '(?!' . join('|', @charlist) . ')(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC])'
                        );

                        $i = $left;
                        last;
                    }
                }
            }

            # rewrite character class or escape character
            elsif (my $char = {
                '.'  => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC])',
                '\D' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])',
                '\W' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])',
                '\S' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])',
                }->{$char[$i]}
            ) {
                $char[$i] = $char;
            }

            # /i option
            elsif ($char[$i] =~ m/\A ([A-Za-z]) \z/oxms) {
                my $c = $1;
                $char[$i] = '[' . CORE::uc($c) . CORE::lc($c) . ']';
            }
        }

        # characterize
        for (my $i=0; $i <= $#char; $i++) {
            next if not defined $char[$i];

            # join separated double octet
            if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
                if ($i < $#char) {
                    $char[$i] .= $char[$i+1];
                    splice(@char,$i+1,1);
                }
            }

            # escape second octet of double octet
            if ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar) \z/oxms) {
                $char[$i] = $1.'\\'.$2;
            }

            # quote double octet character before ? + * {
            elsif (
                ($i >= 1) and
                ($char[$i] =~ m/\A [\?\+\*\{] \z/oxms) and
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] ) \z/oxms)
            ) {
                $char[$i-1] = '(?:' . $char[$i-1] . ')';
            }
        }

        $string = join '', @char;
    }

    # make regexp string
    return @string;
}

#
# ShiftJIS order to character (chr)
#
sub Esjis::chr(;@) {

    if (@_ == 0) {
        if ($_ > 0xFF) {
            return pack('CC', int($_ / 0x100), $_ % 0x100);
        }
        else {
            return CORE::chr($_);
        }
    }
    elsif (@_ == 1) {
        if ($_[0] > 0xFF) {
            return pack('CC', int($_[0] / 0x100), $_[0] % 0x100);
        }
        else {
            return CORE::chr($_[0]);
        }
    }
    else {
        if ($_[0] > 0xFF) {
            return pack('CC', int($_[0] / 0x100), $_[0] % 0x100), @_[1..$#_];
        }
        else {
            return CORE::chr($_[0]), @_[1..$#_];
        }
    }
}

#
# ShiftJIS character to order (ord)
#
sub Esjis::ord(;@) {

    if (@_ == 0) {
        if (m/\A [\x81-\x9F\xE0-\xFC] /oxms) {
            my($ord1,$ord2) = unpack('CC', $_);
            return $ord1 * 0x100 + $ord2;
        }
        else {
            return CORE::ord($_);
        }
    }
    elsif (@_ == 1) {
        if ($_[0] =~ m/\A [\x81-\x9F\xE0-\xFC] /oxms) {
            my($ord1,$ord2) = unpack('CC', $_[0]);
            return $ord1 * 0x100 + $ord2;
        }
        else {
            return CORE::ord($_[0]);
        }
    }
    else {
        if ($_[0] =~ m/\A [\x81-\x9F\xE0-\xFC] /oxms) {
            my($ord1,$ord2) = unpack('CC', $_[0]);
            return $ord1 * 0x100 + $ord2, @_[1..$#_];
        }
        else {
            return CORE::ord($_[0]), @_[1..$#_];
        }
    }
}

#
# ShiftJIS reverse
#
sub Esjis::reverse(@) {

    if (wantarray) {
        return CORE::reverse @_;
    }
    else {
        return join '', CORE::reverse(join('',@_) =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) /oxmsg);
    }
}

#
# ShiftJIS open character list for tr
#
sub _charlist_tr(@) {

    my(@char) = @_;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape - to ...
        if ($char[$i] eq '-') {
            if ((0 < $i) and ($i < $#char)) {
                $char[$i] = '...';
            }
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/oxms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/oxms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/oxms) {
            $char[$i] = Esjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/oxms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbae]) \z/oxms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\x08", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]) \z/oxms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
            $char[$i] .= $char[$i+1];
            splice(@char,$i+1,1);
        }
    }

    # open character list
    for (my $i=$#char-1; $i >= 1; ) {

        # escaped -
        if ($char[$i] eq '...') {
            my @range = ();

            # range of single octet code
            if (
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/oxms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/oxms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin <= $end) {
                    for my $c ($begin..$end) {
                        push(@range, pack('C',$c));
                    }
                }
                else {
                    confess 'esjis: /[\\x'.unpack('H*',$char[$i-1]).'-\\x'.unpack('H*',$char[$i+1]).']/: invalid [] range in regexp';
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/oxms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/oxms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin <= $end) {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/oxms) {
                            push(@range, $char);
                        }
                    }
                }
                else {
                    confess 'esjis: /[\\x'.unpack('H*',$char[$i-1]).'-\\x'.unpack('H*',$char[$i+1]).']/: invalid [] range in regexp';
                }
            }

            # range error
            else {
                confess 'esjis: /[\\x'.unpack('H*',$char[$i-1]).'-\\x'.unpack('H*',$char[$i+1]).']/: invalid [] range in regexp';
            }

            splice(@char, $i-1, 3, @range);
            $i -= 2;
        }
        else {
            $i -= 1;
        }
    }

    return @char;
}

# pop warning
$^W = $_warning;

1;

__END__
