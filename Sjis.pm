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

$VERSION     = sprintf '%d.%02d', q$Revision: 0.11 $ =~ m/(\d+)/xmsg;
@EXPORT      = qw(Split trans Chop index rindex lc uc chr ord reverse);
@EXPORT_OK   = qw();
@EXPORT_TAGS = qw();

use Carp qw(carp croak confess cluck verbose);
use constant DEBUG => 1;
local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
$_warning = $^W; # push warning, warning on
local $^W = 1;

BEGIN {
    if ($^X =~ m/jperl/xmsi) {
        croak "Sjis: need perl(not jperl) 5.00503 or later. (\$^X==$^X)";
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
            return CORE::split $_[0];
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
            return CORE::split $_[0], $_[1];
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
            return CORE::split $_[0], $_[1], $_[2];
        }
    }
}

#
# ShiftJIS transliteration (tr///)
#
sub Sjis::trans($$$;$) {
    local $SIG{__WARN__} = sub { cluck @_ } if DEBUG;
    local $^W = 1;

    my @char            = $_[0] =~ m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) /xmsg;
    my $searchlist      = $_[1];
    my $replacementlist = $_[2];
    my $opt             = $_[3] || '';

    my @searchlist = &_charlist_tr($searchlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) |
            (?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg);

    my @replacementlist = &_charlist_tr($replacementlist =~ m{\G(
        \\     [0-7]{2,3}          |
        \\x    [0-9A-Fa-f]{2}      |
        \\x \{ [0-9A-Fa-f]{1,4} \} |
        \\c    [\x40-\x5F]         |
        \\  (?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) |
            (?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
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
        my @char = m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)/xmsg;
        $Chop = pop @char;
        $_ = join '', @char;
    }
    else {
        for my $string (@_) {
            my @char = $string =~ m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) /xmsg;
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
        return join '', map {$lc{$_}||$_} m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)/xmsg;
    }
    else {
        return join '', map {$lc{$_}||$_} ($_[0] =~ m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)/xmsg);
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
        return join '', map {$uc{$_}||$_} m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) /xmsg;
    }
    else {
        return join '', map {$uc{$_}||$_} ($_[0] =~ m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) /xmsg);
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
        return join '', CORE::reverse(join('',@_) =~ m/\G ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) /xmsg);
    }
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
        elsif ($char[$i] =~ m/\A \\ ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]) \z/xms) {
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

    Split(...);
    trans(...);   # tr///
    Chop(...);    # (beginning 'C')
    index(...);
    rindex(...);
    lc(...);
    uc(...);
    chr(...);
    ord(...);
    reverse(...);

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

Some embeded functions index, rindex, lc, uc, chr, ord and reverse are
overrided on use Sjis. length("\x81\x40") returns 2 like on use bytes,
and m/./ means m/(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)/
like on jperl.

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

=head1 EXAMPLES

=over 4

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

  $trans = trans($string,$searchlist,$replacementlist,$option);
  $trans = trans($string,$searchlist,$replacementlist);

=item Chop string

  $Chop = Chop(@list);
  $Chop = Chop();

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
For example, Sjis::Chop function returns this octet.

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

