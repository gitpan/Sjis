package Sjis;
######################################################################
#
# Sjis - allows you to write your script in ShiftJIS again
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use base qw(Exporter);
use vars qw($VERSION @EXPORT @EXPORT_OK @EXPORT_TAGS $_warning);

$VERSION     = sprintf '%d.%02d', q$Revision: 0.10 $ =~ m/(\d+)/xmsg;
@EXPORT      = qw(qqs qs qqx qqr match gmatch subst gsubst Split trans Chop index rindex lc uc chr ord reverse);
@EXPORT_OK   = qw();
@EXPORT_TAGS = qw();

use Carp qw(carp croak confess cluck verbose);
use constant DEBUG => 1;
local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
$_warning = $^W; # push warning, warning on
local $^W = 1;

# if use eval in regexp then 1 else 0.
use constant USE_REGEXP_EVAL => 0;

# use diagnostics;
# enable diagnostics;
# disable diagnostics;
# use re qw(debug);
# use Data::Dumper;

BEGIN {
    if ($^X =~ m/jperl/xmsi) {
        croak "Sjis: need perl(not jperl) 5.00503 or later. (\$^X==$^X)";
    }
}

#
# ShiftJIS make double quoted strings
#
sub Sjis::qqs($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (wantarray) {
        return map { &_double_quote($_) } CORE::split m/\x0D\x0A | \x0D | \x0A/xms, $_[0];
    }
    else {
        my($q) = @_;
        $q =~ s/(?: \x0D\x0A | \x0D | \x0A) \z//xms;
        return &_double_quote($q);
    }
}

#
# ShiftJIS make single quoted strings
#
sub Sjis::qs($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (wantarray) {
        return CORE::split m/\x0D\x0A | \x0D | \x0A/xms, $_[0];
    }
    else {
        my($q) = @_;
        $q =~ s/(?: \x0D\x0A | \x0D | \x0A) \z//xms;
        return $q;
    }
}

#
# ShiftJIS quoted execute command
#
sub Sjis::qqx($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $command = &Sjis::qqs($_[0]);
    return qx{$command};
}

#
# ShiftJIS quote regexp (qr)
#
sub Sjis::qqr($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $quote_re = &_quote_re($_[0]);
    my $qqr;
    eval {
        $qqr = qr/$quote_re/xms;
    };
    if ($@) {
        croak "Sjis: regexp /$_[0]/";
    }
    return $qqr;
}

#
# ShiftJIS match (m//)
#
sub Sjis::match($;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (@_ == 1) {
        my $re = &_quote_re($_[0]);
        return          m{ (?: \A | [^\x81-\x9F\xE0-\xFC]) (?:[\x81-\x9F\xE0-\xFC]{2})*? $re}xms;
    }
    else {
        my $re = &_quote_re($_[1]);
        return $_[0] =~ m{ (?: \A | [^\x81-\x9F\xE0-\xFC]) (?:[\x81-\x9F\xE0-\xFC]{2})*? $re}xms;
    }
}

#
# ShiftJIS gmatch (m//g)
#
sub Sjis::gmatch($;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (@_ == 1) {
        my $re = &_quote_re($_[0]);
        return          m{ (?: \G | [^\x81-\x9F\xE0-\xFC]) (?:[\x81-\x9F\xE0-\xFC]{2})*? $re}xmsg;
    }
    else {
        my $re = &_quote_re($_[1]);
        return $_[0] =~ m{ (?: \G | [^\x81-\x9F\xE0-\xFC]) (?:[\x81-\x9F\xE0-\xFC]{2})*? $re}xmsg;
    }
}

#
# ShiftJIS subst (s///)
#
sub Sjis::subst($$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $char = '[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]';
    if (@_ == 2) {
        my @pattern = CORE::split m/\x0D\x0A | \x0D | \x0A/xms, $_[1];
        my $replacement = pop @pattern;
        my $re = &_quote_re(join "\n", @pattern);
        return     $_[0] =~ s{\A ( (?:$char)*? ) $re} {$1$replacement}xms;
    }
    else {
        my $re = &_quote_re($_[1]);
        if (ref($_[2]) eq 'CODE') {
            return $_[0] =~ s{\A ( (?:$char)*? ) $re} {$1.&{$_[2]}}xmse;
        }
        else {
            return $_[0] =~ s{\A ( (?:$char)*? ) $re} {$1$_[2]}xms;
        }
    }
}

#
# ShiftJIS gsubst (s///g)
#
sub Sjis::gsubst($$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $char = '[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [^\x81-\x9F\xE0-\xFC]';
    if (@_ == 2) {
        my @pattern = CORE::split m/\x0D\x0A | \x0D | \x0A/xms, $_[1];
        my $replacement = pop @pattern;
        my $re = &_quote_re(join "\n", @pattern);

        # Use of uninitialized value at Sjis.pm line xxx.
        $^W = 0;

        # zero width assertion
        if ($pattern[0] =~ m/\A \(\?(?:=|!|<=|<!).+\) \z/xms) {
            return     $_[0] =~ s{\G ( \A | (?:$char)+? ) $re} {$1$replacement}xmsg;
        }
        else {
            return     $_[0] =~ s{\G (      (?:$char)*? ) $re} {$1$replacement}xmsg;
        }
    }
    else {
        my $re = &_quote_re($_[1]);

        # Use of uninitialized value at Sjis.pm line xxx.
        $^W = 0;

        # zero width assertion
        if ($_[1] =~ m/\A \(\?(?:=|!|<=|<!).+\) \z/xms) {
            if (ref($_[2]) eq 'CODE') {
                return $_[0] =~ s{\G ( \A | (?:$char)+? ) $re} {$1.&{$_[2]}}xmsge;
            }
            else {
                return $_[0] =~ s{\G ( \A | (?:$char)+? ) $re} {$1$_[2]}xmsg;
            }
        }
        else {
            if (ref($_[2]) eq 'CODE') {
                return $_[0] =~ s{\G (      (?:$char)*? ) $re} {$1.&{$_[2]}}xmsge;
            }
            else {
                return $_[0] =~ s{\G (      (?:$char)*? ) $re} {$1$_[2]}xmsg;
            }
        }
    }
}

#
# ShiftJIS split
#
sub Sjis::Split(;$$$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (@_ == 0) {
        return CORE::split;
    }
    elsif (@_ == 1) {
        if ($_[0] eq '') {
            if (wantarray) {
                return      m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
            }
            else {
                carp 'Use of implicit split to @_ is deprecated' if $^W;
                return @_ = m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
            }
        }
        else {
            return CORE::split &Sjis::qqr($_[0]);
        }
    }
    elsif (@_ == 2) {
        if ($_[0] eq '') {
            if (wantarray) {
                return      $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
            }
            else {
                carp 'Use of implicit split to @_ is deprecated' if $^W;
                return @_ = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
            }
        }
        else {
            return CORE::split &Sjis::qqr($_[0]), $_[1];
        }
    }
    elsif (@_ == 3) {
        if ($_[0] eq '') {
            if ($_[2] == 0) {
                if (wantarray) {
                    return      $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
                }
                else {
                    carp 'Use of implicit split to @_ is deprecated' if $^W;
                    return @_ = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
                }
            }
            elsif ($_[2] == 1) {
                return $_[1];
            }
            else {
                my @Split = $_[1] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
                if (scalar(@Split) < $_[2]) {
                    if (wantarray) {
                        return      @Split, '';
                    }
                    else {
                        carp 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @Split, '';
                    }
                }
                elsif (scalar(@Split) == $_[2]) {
                    if (wantarray) {
                        return      @Split;
                    }
                    else {
                        carp 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @Split;
                    }
                }
                else {
                    if (wantarray) {
                        return      @Split[0..$_[2]-2], join '', @Split[$_[2]-1..$#Split];
                    }
                    else {
                        carp 'Use of implicit split to @_ is deprecated' if $^W;
                        return @_ = @Split[0..$_[2]-2], join '', @Split[$_[2]-1..$#Split];
                    }
                }
            }
        }
        else {
            return CORE::split &Sjis::qqr($_[0]), $_[1], $_[2];
        }
    }
}

#
# ShiftJIS transliteration (tr///)
#
sub Sjis::trans($$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my @char = $_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /xmsg;
    my($searchlist,$replacementlist) = CORE::split m/\x0D\x0A | \x0D | \x0A/xms, $_[1];
    if (not defined $searchlist) {
        $searchlist = '';
    }
    if (not defined $replacementlist) {
        $replacementlist = '';
    }
    my $opt = $_[2] || '';

    my @searchlist = &_charlist_tr($searchlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])
    )}xmsg);

    my @replacementlist = &_charlist_tr($replacementlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])
    )}xmsg);

    my %trans = ();
    for (my $i=0; $i <= $#searchlist; $i++) {
        if (not exists $trans{$searchlist[$i]}) {
            if (defined $replacementlist[$i] and ($replacementlist[$i] ne '')) {
                $trans{$searchlist[$i]} = $replacementlist[$i];
            }
            elsif ($opt =~ m/d/xms) {
                $trans{$searchlist[$i]} = '';
            }
            elsif (defined $replacementlist[-1] and ($replacementlist[-1] ne '')) {
                $trans{$searchlist[$i]} = $replacementlist[-1];
            }
            else {
                $trans{$searchlist[$i]} = $searchlist[$i];
            }
        }
    }

    my $trans = 0;
    $_[0] = '';
    if ($opt =~ m/c/xms) {
        while (defined(my $char = shift @char)) {
            if (not exists $trans{$char}) {
                if (defined $replacementlist[0]) {
                    $_[0] .= $replacementlist[0];
                }
                $trans++;
                if ($opt =~ m/s/xms) {
                    while (@char and (not exists $trans{$char[0]})) {
                        shift @char;
                        $trans++;
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
            if (exists $trans{$char}) {
                $_[0] .= $trans{$char};
                $trans++;
                if ($opt =~ m/s/xms) {
                    while (@char and (exists $trans{$char[0]}) and ($trans{$char[0]} eq $trans{$char})) {
                        shift @char;
                        $trans++;
                    }
                }
            }
            else {
                $_[0] .= $char;
            }
        }
    }
    return $trans;
}

#
# ShiftJIS chop
#
sub Sjis::Chop(;@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $Chop;
    if (@_ == 0) {
        my @char = m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
        $Chop = pop @char;
        $_ = join '', @char;
    }
    else {
        for my $string (@_) {
            my @char = $string =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /xmsg;
            $Chop = pop @char;
            $string = join '', @char;
        }
    }
    return $Chop;
}

#
# ShiftJIS index
#
sub Sjis::index($$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my($str,$substr,$position) = @_;
    $position ||= 0;
    my $pos = 0;

    while ($pos < length($str)) {
        if (substr($str,$pos,length($substr)) eq $substr) {
            if ($pos >= $position) {
                return $pos;
            }
        }
        if (substr($str,$pos,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
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
sub Sjis::rindex($$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my($str,$substr,$position) = @_;
    $position ||= length($str) - 1;
    my $pos = 0;
    my $rindex = -1;

    while (($pos < length($str)) and ($pos <= $position)) {
        if (substr($str,$pos,length($substr)) eq $substr) {
            $rindex = $pos;
        }
        if (substr($str,$pos,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
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
sub Sjis::lc(;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my %lc = ();
    @lc{qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)} =
        qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
    if (@_ == 0) {
        return join '', map {$lc{$_}||$_} m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg;
    }
    else {
        return join '', map {$lc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])/xmsg);
    }
}

#
# ShiftJIS upper case (uc)
#
sub Sjis::uc(;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my %uc = ();
    @uc{qw(a b c d e f g h i j k l m n o p q r s t u v w x y z)} =
        qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);
    if (@_ == 0) {
        return join '', map {$uc{$_}||$_} m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /xmsg;
    }
    else {
        return join '', map {$uc{$_}||$_} ($_[0] =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /xmsg);
    }
}

#
# ShiftJIS order to character (chr)
#
sub Sjis::chr(;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (@_ == 0) {
        if ($_ > 0xFF) {
            return pack('CC', int($_ / 0x100), $_ % 0x100);
        }
        else {
            return CORE::chr($_);
        }
    }
    else {
        if ($_[0] > 0xFF) {
            return pack('CC', int($_[0] / 0x100), $_[0] % 0x100);
        }
        else {
            return CORE::chr($_[0]);
        }
    }
}

#
# ShiftJIS character to order (ord)
#
sub Sjis::ord(;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (@_ == 0) {
        if (m/\A [\x81-\x9F\xE0-\xFC] /xms) {
            my($ord1,$ord2) = unpack('CC', $_);
            return $ord1 * 0x100 + $ord2;
        }
        else {
            return CORE::ord($_);
        }
    }
    else {
        if ($_[0] =~ m/\A [\x81-\x9F\xE0-\xFC] /xms) {
            my($ord1,$ord2) = unpack('CC', $_[0]);
            return $ord1 * 0x100 + $ord2;
        }
        else {
            return CORE::ord($_[0]);
        }
    }
}

#
# ShiftJIS reverse
#
sub Sjis::reverse(@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    if (wantarray) {
        return CORE::reverse @_;
    }
    else {
        return join '', CORE::reverse(join('',@_) =~ m/\G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /xmsg);
    }
}

#
# ShiftJIS double quote
#
sub _double_quote($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my @char = ();
    while ($_[0] =~ m{\G(
        \$_    |
        \$\.   |
        \$\/   |
        \$\\   |
        \$,    |
        \$"    |
        \$[#]_ |
        \$\$   |
        \$\?   |
        \$0    |
        \$\]   |
        \$;    |
        \$!    |
        \$\@   |
        \$<    |
        \$>    |
        \$\(   |
        \$\)   |
        \$:    |
        \$\^D  |
        \$\^F  |
        \$\^I  |
        \$\^L  |
        \$\^P  |
        \$\^T  |
        \$\^W  |
        \$\^X  |
        \$[0-9]+ |
        \\  [0-7]{2,3} |
        \\x [0-9A-Fa-f]{2} |
        \\x \{ [0-9A-Fa-f]+ \} |
        \\c [\x40-\x5F] |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])
    )}xmsg) {
        push @char, $1;
    }

    # get caller package
    my $i = 1;
    my $package;
    while (($package) = caller($i++)) {
        if ($package ne __PACKAGE__) {
            last;
        }
    }

    return join '', &_double_quote_list($package,@char);
}

#
# ShiftJIS double quote array
#
sub _double_quote_list($@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my $package = shift @_;
    my @char = @_;

    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape sequence
        if ($char[$i] =~ m/\A (?:\\L|\\U|\\Q|\\E|\\l|\\u) \z/xms) {
        }

        # escape sequence
        elsif ($char[$i] =~ m/\A \\ /xms) {
            if (my $c = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\b",
                '\a' => "\a",
                '\e' => "\e",
                }->{$char[$i]}
            ) {
                $char[$i] = $c;
            }
            elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
                $char[$i] = CORE::chr(oct($1));
            }
            elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
                $char[$i] = CORE::chr(hex($1));
            }
            # \E \L \Q \U \l \u
            elsif ($char[$i] =~ m/\A \\x \{ (5C) (45|4C|51|55|6C|75) \} \z/xmsi) {
                splice(@char,$i,1,CORE::chr(hex($1)),CORE::chr(hex($2)));
            }
            elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]+) \} \z/xms) {
                my $hex = (length($1) % 2) ? ('0' . $1) : $1;
                $char[$i] = pack('H*',$hex);
            }
            elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
                $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
            }
            elsif ($char[$i] =~ m/\A \\ ([\x00-\xFF]*) \z/xms) {
                $char[$i] = $1;
            }
        }

        # special variable interpolation
        elsif ($char[$i] =~ m/\A \$[\x00-\xFF]+ \z/xms) {
            $char[$i] = eval $char[$i];
        }

        # variable interpolation
        elsif (($i < $#char) and (($char[$i] eq '$') or ($char[$i] eq '@'))) {
            my $variable = $i;
            my $right = $i + 1;
            if ($char[$right] eq '{') {
                $char[$right] .= $package . '::';
                while ($right <= $#char) {
                    if ($char[$right] eq '}') {
                        $right++;
                        last;
                    }
                    $right++;
                }
                if ($char[$right-1] ne '}') {
                    croak "Sjis: unmatched {} in double quote string";
                }
            }
            else {
                $char[$i] .= $package . '::';
                if ($char[$right] =~ m/\A [_.\/\\,"#$?*0\[\];!@<>():^] \z/xms) {
                    $right++;
                }
                while ($right <= $#char) {
                    if ($char[$right] !~ m/\A [0-9A-Za-z_':] \z/xms) {
                        last;
                    }
                    $right++;
                }
            }

            # $right points next character

            # scalar variable interpolation
            if ($right > $#char) {
                splice(@char, $i, $right-$i, eval join '', @char[$i..$right-1]);
            }

            # array variable interpolation
            elsif ($char[$right] eq '[') {
                my $left = $right++;
                my $nest = 1;
                while (1) {
                    if ($right > $#char) {
                        croak "Sjis: unmatched [] in double quote string";
                    }
                    elsif ($char[$right] eq '[') {
                        $nest++;
                    }
                    elsif ($char[$right] eq ']') {
                        if (--$nest == 0) {
                            my $index = join '', &_double_quote_list($package,@char[$left+1..$right-1]);
                            splice(@char, $variable, $right-$variable+1, eval join '', 'qq{', @char[$variable..$left], $index, $char[$right], '}');
                            last;
                        }
                    }
                    $right++;
                }
            }

            # hash variable interpolation
            elsif ($char[$right] eq '{') {
                my $left = $right++;
                my $nest = 1;
                while (1) {
                    if ($right > $#char) {
                        croak "Sjis: unmatched {} in double quote string";
                    }
                    elsif ($char[$right] eq '{') {
                        $nest++;
                    }
                    elsif ($char[$right] eq '}') {
                        if (--$nest == 0) {
                            my $key = join '', &_double_quote_list($package,@char[$left+1..$right-1]);
                            splice(@char, $variable, $right-$variable+1, eval join '', 'qq{', @char[$variable..$left], $key, $char[$right], '}');
                            last;
                        }
                    }
                    $right++;
                }
            }

            # scalar variable interpolation
            else {
                splice(@char, $i, $right-$i, eval join '', @char[$i..$right-1]);
            }
        }

        # normal character
        else {
        }
    }

    # \L \U \Q \E \l \u
    my $case = '';
    my $casefirst = '';
    my $quotemeta = '';
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        if ($char[$i] eq '\\L') {
            $case = 'L';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\U') {
            $case = 'U';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\Q') {
            $quotemeta = 'Q';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\E') {
            $case = '';
            $quotemeta = '';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\l') {
            $casefirst = 'l';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\u') {
            $casefirst = 'u';
            $char[$i] = '';
        }
        else {
            if ($case eq 'L') {
                $char[$i] = Sjis::lc $char[$i];
            }
            elsif ($case eq 'U') {
                $char[$i] = Sjis::uc $char[$i];
            }

            if ($casefirst eq 'l') {
                $char[$i] = CORE::lcfirst $char[$i];
                $casefirst = '';
            }
            elsif ($casefirst eq 'u') {
                $char[$i] = CORE::ucfirst $char[$i];
                $casefirst = '';
            }

            if ($quotemeta eq 'Q') {
                $char[$i] = CORE::quotemeta $char[$i];
            }
        }
    }

    return @char;
}

#
# ShiftJIS quote regexp
#
sub _quote_re($) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    # get caller package name
    my $i = 1;
    my $package;
    while (($package) = caller($i++)) {
        if ($package ne __PACKAGE__) {
            last;
        }
    }

    # split regexp
    my @char = ();
    @char = $_[0] =~ m{\G(
        \$_    |
        \$\.   |
        \$\/   |
#       \$\\   |
        \$,    |
        \$"    |
        \$[#]_ |
#       \$\$   |
        \$\?   |
        \$0    |
        \$\]   |
        \$;    |
        \$!    |
        \$\@   |
        \$<    |
        \$>    |
#       \$\(   |
#       \$\)   |
        \$:    |
        \$\^D  |
        \$\^F  |
        \$\^I  |
        \$\^L  |
        \$\^P  |
        \$\^T  |
        \$\^W  |
        \$\^X  |
        \$[0-9]+               |
        \\  [0-7]{2,3}         |
        \\x [0-9A-Fa-f]{2}     |
        \\x \{ [0-9A-Fa-f]+ \} |
        \\c [\x40-\x5F] |
        \\  (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) |
        \[\^ |
            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF])
    )}xmsg;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    croak "Sjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &_charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ([^A-Za-z_0-9]) \z/xms) {
                               $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/xms) {
                                $char = '\\' . $_;
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    croak "Sjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &_charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for my $char (@charlist) {

                        # do not use quotemeta here
                        if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ([^A-Za-z_0-9]) \z/xms) {
                            $char = $1.'\\'.$2;
                        }
                        elsif ($char =~ m/\A [.|)] \z/xms) {
                            $char = '\\' . $_;
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^a-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # unescape for join separated double octet
        #                              $    (    )    *    +    .    ?    [   \   ^   {   |
        elsif ($char[$i] =~ m/\A \\ (?:0?44|0?50|0?51|0?52|0?53|0?56|0?77|133|134|136|173|174) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        #                               $  (  )  *  +  .  ?  [  \  ^  {  |
        elsif ($char[$i] =~ m/\A \\x (?:24|28|29|2A|2B|2E|3F|5B|5C|5E|7B|7C) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]+) \} \z/xms) {
            my $hex = (length($1) % 2) ? ('0' . $1) : $1;
            $char[$i] = CORE::quotemeta pack('H*',$hex);
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }

        # special variable interpolation
        elsif ($char[$i] =~ m/\A \$[\x00-\xFF]+ \z/xms) {
            $char[$i] = eval $char[$i];
        }

        # variable interpolation
        elsif (($i < $#char) and (($char[$i] eq '$') or ($char[$i] eq '@'))) {
            my $variable = $i;
            my $right = $i + 1;
            if ($char[$right] eq '{') {
                $char[$right] .= $package . '::';
                while ($right <= $#char) {
                    if ($char[$right] eq '}') {
                        $right++;
                        last;
                    }
                    $right++;
                }
                if ($char[$right-1] ne '}') {
                    croak "Sjis: unmatched {} in double quote string";
                }
            }
            else {
                $char[$i] .= $package . '::';
                if ($char[$right] =~ m/\A [_.\/\\,"#$?*0\[\];!@<>():^] \z/xms) {
                    $right++;
                }
                while ($right <= $#char) {
                    if ($char[$right] !~ m/\A [0-9A-Za-z_':] \z/xms) {
                        last;
                    }
                    $right++;
                }
            }

            # $right points next character

            # scalar variable interpolation
            if ($right > $#char) {
                splice(@char, $i, $right-$i, eval join '', @char[$i..$right-1]);
            }

            # array variable interpolation
            elsif ($char[$right] eq '[') {
                my $left = $right++;
                my $nest = 1;
                while (1) {
                    if ($right > $#char) {
                        croak "Sjis: unmatched [] in double quote string";
                    }
                    elsif ($char[$right] eq '[') {
                        $nest++;
                    }
                    elsif ($char[$right] eq ']') {
                        if (--$nest == 0) {
                            my $index = join '', &_double_quote_list($package,@char[$left+1..$right-1]);
                            splice(@char, $variable, $right-$variable+1, eval join '', 'qq{', @char[$variable..$left], $index, $char[$right], '}');
                            last;
                        }
                    }
                    $right++;
                }
            }

            # hash variable interpolation
            elsif ($char[$right] eq '{') {
                my $left = $right++;
                my $nest = 1;
                while (1) {
                    if ($right > $#char) {
                        croak "Sjis: unmatched {} in double quote string";
                    }
                    elsif ($char[$right] eq '{') {
                        $nest++;
                    }
                    elsif ($char[$right] eq '}') {
                        if (--$nest == 0) {
                            my $key = join '', &_double_quote_list($package,@char[$left+1..$right-1]);
                            splice(@char, $variable, $right-$variable+1, eval join '', 'qq{', @char[$variable..$left], $key, $char[$right], '}');
                            last;
                        }
                    }
                    $right++;
                }
            }

            # scalar variable interpolation
            else {
                splice(@char, $i, $right-$i, eval join '', @char[$i..$right-1]);
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # join separated double octet
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            if ($i < $#char) {
                $char[$i] .= $char[$i+1];
                splice(@char,$i+1,1);
            }
        }

        # escape second octet of double octet
        if ($char[$i] =~ m/\A \\? ([\x81-\x9F\xE0-\xFC]) ([^A-Za-z_0-9]) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # unescape double octet
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{2} | \\x\{[0-9A-Fa-f]+\} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    # \L \U \Q \E \l \u
    my $case = '';
    my $casefirst = '';
    my $quotemeta = '';
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        if ($char[$i] eq '\\L') {
            $case = 'L';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\U') {
            $case = 'U';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\Q') {
            $quotemeta = 'Q';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\E') {
            $case = '';
            $quotemeta = '';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\l') {
            $casefirst = 'l';
            $char[$i] = '';
        }
        elsif ($char[$i] eq '\\u') {
            $casefirst = 'u';
            $char[$i] = '';
        }
        else {
            if ($case eq 'L') {
                $char[$i] = Sjis::lc $char[$i];
            }
            elsif ($case eq 'U') {
                $char[$i] = Sjis::uc $char[$i];
            }

            if ($casefirst eq 'l') {
                $char[$i] = CORE::lcfirst $char[$i];
                $casefirst = '';
            }
            elsif ($casefirst eq 'u') {
                $char[$i] = CORE::ucfirst $char[$i];
                $casefirst = '';
            }

            if ($quotemeta eq 'Q') {
                $char[$i] = CORE::quotemeta $char[$i];
            }
        }
    }

    # return ShiftJIS regexp string
    my $re = join '', @char;
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            croak "$1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# ShiftJIS open character list for qr
#
sub _charlist_qr(@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

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
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/xms) {
            $char[$i] = Sjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbaedDwWsS]) \z/xms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\b", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
                '\d' => "[0-9]",
                '\w' => "[a-zA-Z_0-9]",
                '\s' => "[\x20\t\n\r\f]",
                '\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9])",
                '\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^a-zA-Z_0-9])",
                '\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x20\t\n\r\f])",
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
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
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/xms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin > $end) {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                else {
                    for my $c ($begin..$end) {
                        push(@range, pack('C',$c));
                    }
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin > $end) {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                elsif (
my $range = {

"\x81\x40-\x98\x72" => '(?:[\x81-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x81\x40-\xEA\x9E" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x81\x40-\xEA\xA2" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x81\x40-\xEA\xA4" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x81\x40-\xFC\xFC" => '(?:[\x81-\x9F\xE0-\xFC][\x40-\x7E\x80-\xFC])',
"\x82\x4F-\x82\x58" => '(?:\x82[\x4F-\x58])',
"\x82\x60-\x82\x79" => '(?:\x82[\x60-\x79])',
"\x82\x81-\x82\x9A" => '(?:\x82[\x81-\x9A])',
"\x82\x9F-\x82\xF1" => '(?:\x82[\x9F-\xF1])',
"\x83\x40-\x83\x96" => '(?:\x83[\x40-\x7E\x80-\x96])',
"\x83\x9F-\x83\xB6" => '(?:\x83[\x9F-\xB6])',
"\x83\xBF-\x83\xD6" => '(?:\x83[\xBF-\xD6])',
"\x84\x40-\x84\x60" => '(?:\x84[\x40-\x60])',
"\x84\x70-\x84\x91" => '(?:\x84[\x70-\x91])',
"\x84\x9F-\x84\xBE" => '(?:\x84[\x9F-\xBE])',
"\x87\x40-\x87\x53" => '(?:\x87[\x40-\x53])',
"\x87\x40-\x87\x9C" => '(?:\x87[\x40-\x5D\x5F-\x75\x7E\x80-\x9C])',
"\x87\x54-\x87\x5D" => '(?:\x87[\x54-\x5D])',
"\x88\x9F-\x98\x72" => '(?:\x88[\x9F-\xFC]|[\x89-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x88\x9F-\xEA\x9E" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x88\x9F-\xEA\xA2" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x88\x9F-\xEA\xA4" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x98\x9F-\xEA\x9E" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x98\x9F-\xEA\xA2" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x98\x9F-\xEA\xA4" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\xED\x40-\xEE\xFC" => '(?:\xED[\x40-\x7E\x80-\xFC]|\xEE[\x40-\x7E\x80-\xEC\xEF-\xFC])',
"\xFA\x40-\xFC\x4B" => '(?:[\xFA-\xFB][\x40-\x7E\x80-\xFC]|\xFC[\x40-\x4B])',

}->{"$begin-$end"}
                ) {
                    push(@range, $range);
                }
                else {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/xms) {
                            push(@range, $char);
                        }
                    }
                }
            }

            # range error
            else {
                croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
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

#
# ShiftJIS open character list for not qr
#
sub _charlist_not_qr(@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

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
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/xms) {
            $char[$i] = Sjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbaedDwWsS]) \z/xms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => '\n',
                '\r' => '\r',
                '\t' => '\t',
                '\f' => '\f',
                '\b' => "\b", # \b means backspace in character class
                '\a' => '\a',
                '\e' => '\e',
                '\d' => '[0-9]',
                '\w' => '[a-zA-Z_0-9]',
                '\s' => '[\x20\t\n\r\f]',
                '\D' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9])',
                '\W' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^a-zA-Z_0-9])',
                '\S' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x20\t\n\r\f])',
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            $char[$i] .= $char[$i+1];
            splice(@char,$i+1,1);
        }
    }

    # open character list
    for (my $i=$#char-1; $i >= 1; ) {

        # escaped -
        if ($char[$i] eq '...') {
            my @range = ();

            # unescape character
            for my $char ($char[$i-1], $char[$i+1]) {
                $char = {
                    '\n' => "\n",
                    '\r' => "\r",
                    '\t' => "\t",
                    '\f' => "\f",
                    '\a' => "\a",
                    '\e' => "\e",
                }->{$char} || $char;
            }

            # range of single octet code
            if (
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/xms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin > $end) {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                else {
                    push @range, join('', '[', $char[$i-1], '-', $char[$i+1], ']');
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin > $end) {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                elsif (
my $range = {

"\x81\x40-\x98\x72" => '(?:[\x81-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x81\x40-\xEA\x9E" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x81\x40-\xEA\xA2" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x81\x40-\xEA\xA4" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x81\x40-\xFC\xFC" => '(?:[\x81-\x9F\xE0-\xFC][\x40-\x7E\x80-\xFC])',
"\x82\x4F-\x82\x58" => '(?:\x82[\x4F-\x58])',
"\x82\x60-\x82\x79" => '(?:\x82[\x60-\x79])',
"\x82\x81-\x82\x9A" => '(?:\x82[\x81-\x9A])',
"\x82\x9F-\x82\xF1" => '(?:\x82[\x9F-\xF1])',
"\x83\x40-\x83\x96" => '(?:\x83[\x40-\x7E\x80-\x96])',
"\x83\x9F-\x83\xB6" => '(?:\x83[\x9F-\xB6])',
"\x83\xBF-\x83\xD6" => '(?:\x83[\xBF-\xD6])',
"\x84\x40-\x84\x60" => '(?:\x84[\x40-\x60])',
"\x84\x70-\x84\x91" => '(?:\x84[\x70-\x91])',
"\x84\x9F-\x84\xBE" => '(?:\x84[\x9F-\xBE])',
"\x87\x40-\x87\x53" => '(?:\x87[\x40-\x53])',
"\x87\x40-\x87\x9C" => '(?:\x87[\x40-\x5D\x5F-\x75\x7E\x80-\x9C])',
"\x87\x54-\x87\x5D" => '(?:\x87[\x54-\x5D])',
"\x88\x9F-\x98\x72" => '(?:\x88[\x9F-\xFC]|[\x89-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x88\x9F-\xEA\x9E" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x88\x9F-\xEA\xA2" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x88\x9F-\xEA\xA4" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x98\x9F-\xEA\x9E" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x98\x9F-\xEA\xA2" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x98\x9F-\xEA\xA4" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\xED\x40-\xEE\xFC" => '(?:\xED[\x40-\x7E\x80-\xFC]|\xEE[\x40-\x7E\x80-\xEC\xEF-\xFC])',
"\xFA\x40-\xFC\x4B" => '(?:[\xFA-\xFB][\x40-\x7E\x80-\xFC]|\xFC[\x40-\x4B])',

}->{"$begin-$end"}
                ) {
                    push(@range, $range);
                }
                else {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/xms) {
                            push(@range, $char);
                        }
                    }
                }
            }

            # range error
            else {
                croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
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

#
# ShiftJIS open character list for tr
#
sub _charlist_tr(@) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

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
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/xms) {
            $char[$i] = Sjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbae]) \z/xms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\b", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
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
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/xms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin <= $end) {
                    for my $c ($begin..$end) {
                        push(@range, pack('C',$c));
                    }
                }
                else {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin <= $end) {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/xms) {
                            push(@range, $char);
                        }
                    }
                }
                else {
                    croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
            }

            # range error
            else {
                croak 'Sjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
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
=pod

=head1 NAME

Sjis - allows you to write your script in ShiftJIS again

=head1 SYNOPSIS

  use Sjis;

    qs <<'END';   # quote string (single quote)
    qqs <<'END';  # quote string (double quote)
    qqx <<'END';  # qx//
    qqr <<'END';  # qr//
    match(...);   # m//
    gmatch(...);  # m//g
    subst(...);   # s///
    gsubst(...);  # s///g
    Split(...);
    trans(...);
    Chop(...);
    index(...);
    rindex(...);
    lc(...);
    uc(...);
    chr(...);
    ord(...);
    reverse(...);

  use Sjis ();

    Sjis::qs <<'END';   # quote string (single quote)
    Sjis::qqs <<'END';  # quote string (double quote)
    Sjis::qqx <<'END';  # qx//
    Sjis::qqr <<'END';  # qr//
    Sjis::match(...);   # m//
    Sjis::gmatch(...);  # m//g
    Sjis::subst(...);   # s///
    Sjis::gsubst(...);  # s///g
    Sjis::Split(...);
    Sjis::trans(...);
    Sjis::Chop(...);
    Sjis::index(...);
    Sjis::rindex(...);
    Sjis::lc(...);
    Sjis::uc(...);
    Sjis::chr(...);
    Sjis::ord(...);
    Sjis::reverse(...);

  # "no Sjis;" not supported

=head1 ABSTRACT

Let's start with a bit of history: jperl 4.036+1.4 introduced ShiftJIS
support.  You could apply C<chop()> and regexps even to complex CJK
characters -- so long as the script was written in ShiftJIS.

Since Perl5.8, Encode module is supported for multilingual processing,
and it was said that jperl became unnecessary. But is it really so?

The UTF-8 is still rare on the Microsoft Windows(most popular operating
systems we love), so many users hope to write scripts in ShiftJIS encodings;
without giving up a whole new feature of Perl5.8/5.10.

Some embeded functions index, rindex, lc, uc, chr and ord are overrided on
use Sjis. length("\x81\x40") returns 2 like on use bytes, and m/./ means
m/(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[\x00-\xFF])/ like on jperl.

To use Sjis module, you can write your script in ShiftJIS encoding you
like and still enjoy ShiftJIS support.

=head1 DESCRIPTION

The C<Sjis> module provides the interfaces between Perl's strings
and the rest of the system.  Perl strings are sequences of
B<characters also bytes>.

Traditionally, computer data has been moved around in 8-bit chunks
often called "bytes". These chunks are also known as "octets" in
networking standards. Perl is widely used to manipulate data of many
types - not only strings of characters representing human or computer
languages but also "binary" data being the machine's representation of
numbers, pixels in an image - or just about anything.

When Perl is processing "binary data", the programmer wants Perl to
process "sequences of bytes". This is not a problem for Perl - as a
byte has 256 possible values, it easily fits in Perl's much larger
"logical character".

When ShiftJIS becomes the standard source format, this module will
effectively become a no-op.

=head1 Literal No Conversions

You can write code in ShiftJIS as follows:

    subst($_, <<'X');
\bCamel\b
\xE9\x70\xE9\x6B
X
#<char-><-char->   # 4 octets, two ShiftJIS Characters
                   # Camel in Kanji

For example:

    use Sjis;
    my $string = chr(0x82A0); # a ShiftJIS string
    print length($string . chr(0x82A0));

Will print C<4>, because C<$string> is not upgraded as UTF-8 but bytes
string.

=head1 NOT SCOPED

The module is a per script, not a per block lexical.  Only the last
C<use Sjis> matters, and it affects B<the whole script>.
And the <no Sjis> is not supported and B<use Sjis> can appear as many
times as you want in a given script.
The multiple use of this module is discouraged.

By the same reason, the use this module inside modules is also
discouraged (though not as strongly discouraged as the case above.
See below).

If you still have to write a module with Sjis module, be very careful
of the load order.  See the codes below;

  # called module
  package Module_IN_BAR;
  use Sjis;
  # stuff ShiftJIS string here
  1;
  __END__

  # caller script
  use Module_IN_BAR;
  # surprise! use Sjis is in effect.
  __END__

The best way to avoid this oddity is to use this module RIGHT AFTER
other modules are loaded.  i.e.

  # called module
  package Module_IN_BAR;
  # no stuff ShiftJIS string here
  1;
  __END__

  # caller script
  use Module_IN_BAR;
  use Sjis;
  # stuff ShiftJIS string here
  __END__

=head1 BUGS AND LIMITATIONS

Function qqr, match, gmatch, subst, gsubst and first parameter of Split is added
/xms option automatically.

The variable needs to be a global in order for qqr to embed into quoted string.

$1,$2,$3... can not be used after match of regular expression.

Please patches and report problems to author are welcome.

=head1 HISTORY

This Sjis module first appeared in ActivePerl Build 522 Built under
MSWin32 Compiled at Nov 2 1999 09:52:28

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=head1 MAKING LITERAL ShiftJIS STRING

  $_ = qs << 'END';
  ShiftJIS STRING HERE
  END

  ($a, $b, $c) = qs << 'END';
  ShiftJIS STRING1
  ShiftJIS STRING2
  ShiftJIS STRING3
  END

  my($name, $career, $memo, $comment) = qs << 'END';
  SUZUKI Ichitaro
  Japanese MAJOR word processor
  He has a big mouth and is used even in the United States.
  ShiftJIS STRINGS HERE
  END

=head1 EXAMPLES

=over 4

=item Quote execute command

  $output = qqx <<'X';
command here
X

=item Quote pattern

  $re = qqr <<'X';
pattern
X

  Option /xms is added automatically.

=item Matching

  $match = match($string,<<'X');
pattern
X

  Option /xms is added automatically.

  $match = match(<<'X');
pattern
X

  Option /xms is added automatically.

  @match = gmatch($string,<<'X');
pattern
X

  Option /xms is added automatically.

  @match = gmatch(<<'X');
pattern
X

  Option /xms is added automatically.

=item Substitution

  subst($string,<<'X');
pattern
replacement
X

  Option /xms is added automatically.
  $1 is used inside Sjis module, you can use from $2.

  subst($string,<<'X',\&replacement);
pattern
X

  Option /xms is added automatically.
  $1 is used inside Sjis module, you can use from $2.

  gsubst($string,<<'X');
pattern
replacement
X

  Option /xms is added automatically.
  $1 is used inside Sjis module, you can use from $2.

  gsubst($string,<<'X',\&replacement);
pattern
X

  Option /xms is added automatically.
  $1 is used inside Sjis module, you can use from $2.

=item Split string

  @Split = Split;

  @Split = Split('');

  @Split = Split('',$string);

  @Split = Split('',$string,$limit);

  @Split = Split($fs);

  @Split = Split($fs,$string);

  @Split = Split($fs,$string,$limit);

  Option /xms is added automatically.

=item Transliteration

  $trans = trans($string,<<'X',$option);
searchlist
replacementlist
X

  $trans = trans($string,<<'X');
searchlist
replacementlist
X

=item Chop string

  $chop = Chop(@list);
  $chop = Chop();

=item Index string

  $pos = index($string,$substr,$position);
  $pos = index($string,$substr);

=item Reverse index string

  $pos = rindex($string,$substr,$position);
  $pos = rindex($string,$substr);

=item Lower case string

  $lc = lc($string);
  $lc = lc();

=item Upper case string

  $uc = uc($string);
  $uc = uc();

=item Make character

  $chr = chr($code);
  $chr = chr();

=item Order of Character

  $ord = ord($string);
  $ord = ord();

=item Reverse

  @reverse = reverse(@list);
  $reverse = reverse(@list);

=back

=head1 THE GOAL

=over 2

=item Goal #1:

Old byte-oriented programs should not spontaneously break on the old
byte-oriented data they used to work on.

Yes, sure.

=item Goal #2:

Old byte-oriented programs should magically start working on the new
character-oriented data when appropriate.

Yes, Sjis module is here.

=item Goal #3:

Programs should run just as fast in the new character-oriented mode
as in the old byte-oriented mode.

Maybe.
Because character-oriented mode is byte-oriented mode on Sjis module.

=item Goal #4:

Perl should remain one language, rather than forking into a
byte-oriented Perl and a character-oriented Perl.

Same as #3.

=back

=head1 ShiftJIS IN WIKIPEDIA

Shift JIS (2008.02.15 15:02:00 JST). In Wikipedia: The Free Encyclopedia.
Retrieved from
L<http://en.wikipedia.org/wiki/Shift_JIS>

Shift JIS (also SJIS, MIME name Shift_JIS) is a character encoding
for the Japanese language originally developed by a Japanese company
called ASCII Corporation in conjunction with Microsoft and standardized
as JIS X 0208 Appendix 1. It is based on character sets defined within
JIS standards JIS X 0201:1997 (for the single-byte characters) and
JIS X 0208:1997 (for the double byte characters). The lead bytes for
the double byte characters are "shifted" around the 64 halfwidth katakana
characters in the single-byte range 0xA1 to 0xDF. The single-byte
characters 0x00 to 0x7F match the ASCII encoding, except for a yen sign
at 0x5C and an overline at 0x7E in place of the ASCII character set's
backslash and tilde respectively. On the web, 0x5C is still used as the
Perl Script escape character. The single-byte characters from 0xA1 to 0xDF
map to the half-width katakana characters found in JIS X 0201. 

Shift JIS requires an 8-bit medium for transmission. It is fully backwards
compatible with the legacy JIS X 0201 single-byte encoding, meaning it
supports half-width katakana and that any valid JIS X 0201 string is also
a valid Shift JIS string. However Shift JIS only guarantees that the first
byte will be in the upper ASCII range; the value of the second byte can be
either high or low. This makes reliable Shift JIS detection difficult.
On the other hand, the competing 8-bit format EUC-JP, which does not
support single-byte halfwidth katakana, allows for a much cleaner and
direct conversion to and from JIS X 0208 codepoints, as all upper-ASCII
bytes are part of a double-byte character and all lower-ASCII bytes are
part of a single-byte character.

Many different versions of Shift JIS exist. There are two areas for
expansion: Firstly, JIS X 0208 does not fill the whole 94x94 space encoded
for it in Shift JIS, therefore there is room for more characters here ?
these are really extensions to JIS X 0208 rather than to Shift JIS itself.
The most popular extension here is to the Windows-31J (otherwise known as
Code page 932) encoding popularized by Microsoft, although Microsoft
itself does not recognize the Windows-31J name and instead calls that
variation "shift_jis". Secondly, Shift JIS has more encoding space than is
needed for JIS X 0201 and JIS X 0208, and this space can and is used for
yet more characters. The space with lead bytes 0xF5 to 0xF9 is used by
Japanese mobile phone operators for pictographs for use in E-mail, for
example (KDDI goes further and defines hundreds more in the space with
lead bytes 0xF3 and 0xF4).

Beyond even this there have been numerous minor variations made on Shift
JIS, with individual characters here and there altered. Most of these
extensions and variants have no IANA registration, so there is much scope
for confusion if the extensions are used. Microsoft Code Page 932 is
registered separately from Shift JIS.
IBM CCSID 943 has the same extensions as Code Page 932.
As with most code pages and encodings it is recommended that Unicode be
used instead.

=head1 "ShiftJIS" IN THIS MODULE

 The "ShiftJIS" in this module means widely codeset than general
ShiftJIS. The double octet code is limited by only first octet.

    Single octet code is:
      0x00-0x80, 0xA0-0xDF and 0xFD-0xFF

    Double octet code is:
      First octet   0x81-0x9F and 0xE0-0xFC
      Second octet  0x00-0xFF (All octet)

    MALFORMED single octet code is:
      0x81-0x9F and 0xE0-0xFC
      * Final octet of string like first octet of double octet code

 So this "ShiftJIS" can handle any code of ShiftJIS based code without
Informix Ascii 'INFORMIX V6 ALS' is triple octet code.
(I'm sorry, Informix Ascii users.)

See also code table:

        Single octet code

  0 1 2 3 4 5 6 7 8 9 A B C D E F 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
8|*| | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
9| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
E| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                Double octet code
           First octet                                     Second octet

  0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
0| | | | | | | | | | | | | | | | |              0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0xFF
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
1| | | | | | | | | | | | | | | | |              1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
2| | | | | | | | | | | | | | | | |              2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
3| | | | | | | | | | | | | | | | |              3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


   *MALFORMED* Single octet code

 Final octet of string like first octet of double octet code

Even if malformed, it is not ignored and not deleted automatically.
For example, &Sjis::Chop function returns this octet.

  0 1 2 3 4 5 6 7 8 9 A B C D E F 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
0| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
1| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
2| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
3| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
4| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
5| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
6| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
7| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
8| |M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| 0x81-0x9F
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
9|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
A| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
B| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
C| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
D| | | | | | | | | | | | | | | | |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
E|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
F|M|M|M|M|M|M|M|M|M|M|M|M|M| | | |  0xE0-0xFC
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


The ShiftJIS list via vendors:
L<http://home.m05.itscom.net/numa/cde/sjis-euc/sjis.html>

DEC PC                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
DEC WS                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Fujitsu TrueType font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Fujitsu FontCity font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Hitachi PC                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Hitachi WS                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
IBM                            0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
NEC Windows (PC)               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
NEC DOS (PC)                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
SONY NEWS-OS                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Sun Wabi                       0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Unisys PC                      0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
HP Japan Japanese HP-15        0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
AT&T Japan                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Mitsubishi Electric FONTRUNNER 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Concurrent Japan               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
Informix ASCII INFORMIX V6 ALS 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC), (0xFD)(0xA1-0xFE)(0xA1-0xFE)
Oracle Oracle7 (Release 7.1.3) 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x00-0xFF)
Sybase SQL Server, Open Server 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)

=head1 SEE ALSO

C<Programming Perl, Third Edition>
By Larry Wall, Tom Christiansen, Jon Orwant
Third Edition  July 2000
Pages: 1104
ISBN 10: 0-596-00027-8 | ISBN 13:9780596000271
L<http://www.oreilly.com/catalog/pperl3/index.html>

C<CJKV Information Processing>
Chinese, Japanese, Korean & Vietnamese Computing
By Ken Lunde
First Edition  January 1999
Pages: 1128
ISBN 10: 1-56592-224-7 | ISBN 13:9781565922242
L<http://www.oreilly.com/catalog/cjkvinfo/index.html>

C<Mastering Regular Expressions, Third Edition>
By Jeffrey E. F. Friedl
Third Edition  August 2006
Pages: 542
ISBN 10: 0-596-52812-4 | ISBN 13:9780596528126
L<http://www.oreilly.com/catalog/regex3/index.html>

=head1 ACKNOWLEDGEMENTS

This module was made, thanks to the following hackers or persons.
Especially this POD was written referring from the Encode module.
I am thankful to all persons.

Rick Yamashita, ShiftJIS
http://furukawablog.spaces.live.com/Blog/cns!1pmWgsL289nm7Shn7cS0jHzA!2225.entry

Larry Wall, Perl
L<http://www.perl.org/>

Kazumasa Utashiro, jcode.pl
L<http://www.srekcah.org/jcode/>

Jeffrey E. F. Friedl, Mastering Regular Expressions
L<http://www.oreilly.com/catalog/regex/index.html>

SADAHIRO Tomoyuki, The right way of using ShiftJIS
L<http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm>

jscripter, For jperl users
L<http://homepage1.nifty.com/kazuf/jperl.html>

Hizumi, Perl5.8/Perl5.10 is not useful on the Windows.
L<http://www.aritia.org/hizumi/perl/perlwin.html>

SUZUKI Norio, Jperl
L<http://homepage2.nifty.com/kipp/perl/jperl/>

Dan Kogai, Encode module
L<http://search.cpan.org/dist/Encode/>

=cut

