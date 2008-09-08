######################################################################
#
# make-ebig5plus.pl - Source code filter for making source code filter to escape Big5Plus
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;

for my $io (
    ['esjis.pl' => 'ebig5plus.pl'],
    ['Esjis.pm' => 'Ebig5plus.pm'],
    ['Sjis.pm'  => 'Big5Plus.pm'],
) {
    my $i = $io->[0];
    my $o = $io->[1];

    print STDERR "$i --> $o\n";

    open(I,$i)    || die "Can't open file: $i\n";
    open(O,">$o") || die "Can't open file: $o\n";
    binmode(O);

    while (<I>) {
        s/\\x81-\\x9F\\xE0-\\xFC/\\x81-\\xFE/g;
        s/\(\?:8\[1-9A-Fa-f\]\|9\[0-9A-Fa-f\]\|\[Ee\]\[0-9A-Fa-f\]\|\[Ff\]\[0-9A-Ca-c\]\)/(?:8[1-9A-Fa-f]|[9A-Ea-e][0-9A-Fa-f]|[Ff][0-9A-Ea-e])/g;
        s/\(\?:20\[1-7\]\|2\[123\]\[0-7\]\|3\[4-6\]\[0-7\]\|37\[0-4\]\)/(?:2[0-7][1-7]|3[0-7][0-6])/g;
        s/\\x40-\\x7E\\x80-\\xFC/\\x40-\\x7E\\x80-\\xFE/g;
        s/\bEsjis\b/Ebig5plus/g;
        s/ShiftJIS/Big5Plus/g;
        s/\besjis\.pl\b/ebig5plus.pl/g;
        s/Sjis/Big5Plus/g;

        print O $_;
    }

    close(I);
    close(O);
}

__END__

=pod

=head1 NAME

make-ebig5plus.pl - Source code filter for making source code filter to escape Big5Plus

=head1 SYNOPSIS

perl make-ebig5plus.pl

=head1 DESCRIPTION

This utility makes ebig5plus.pl from esjis.pl for escape Big5Plus script.

=head1 BUGS AND LIMITATIONS

Please patches and report problems to author are welcome.

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This software is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=head1 Big5 IN WIKIPEDIA

Big5 (2008.08.24 17:45:00 JST). In Wikipedia: The Free Encyclopedia.
Retrieved from
L<http://en.wikipedia.org/wiki/Big5>

Big5
From Wikipedia, the free encyclopedia
Big-5 or Big5 is a character encoding method used in Taiwan, Hong Kong and
Macau for Traditional Chinese characters. Its Mainland China equivalent is GB.

Organization
The original Big5 character set is sorted first by usage frequency, second by
stroke count, lastly by Kangxi radical.
The original Big5 character set lacked many commonly used characters. To solve
this problem, each vendor developed its own extension. The ETen extension
became part of the current Big5 standard through popularity.
The structure of Big5 does not conform to the ISO 2022 standard, but rather
bears a certain similarity to the Shift JIS encoding. It is a double-byte
character set (DBCS) with the following structure:

First byte ("lead byte") 0x81 to 0xfe
Second byte 0x40 to 0x7e, 0xa1 to 0xfe

Certain variants of the Big5 character set, for example the HKSCS, use an
expanded range for the lead byte including values in the 0x81 to 0xA0 range
(similar to Shift JIS).

If the second byte is not in the correct range, behaviour is undefined
(i.e., varies from system to system).

The numerical value of individual Big5 codes are frequently given as a 4-digit
hexadecimal number, which describes the two bytes that comprise the Big5 code
as if the two bytes were a big endian representation of a 16-bit number.
For example, the Big5 code for a full-width space, which are the bytes 0xa1
0x40, is usually written as 0xa140 or just A140.

Strictly speaking, the Big5 encoding contains only DBCS characters. However,
in practice, the Big5 codes are always used together with an unspecified,
system-dependent single-byte character set (ASCII, or an 8-bit character set
such as code page 437), so that you will find a mix of DBCS characters and
single-byte characters in Big5-encoded text. Bytes in the range 0x00 to 0x7f
that are not part of a double-byte character are assumed to be single-byte
characters. (For a more detailed description of this problem, please see the
discussion on "The Matching SBCS" below.)

The meaning of non-ASCII single bytes outside the permitted values that are
not part of a double-byte character varies from system to system. In old
MSDOS-based systems, they are likely to be displayed as 8-bit characters;
in modern systems, they are likely to either give unpredictable results or
generate an error.

A more detailed look at the organization
In the original Big5, the encoding is compartmentalized into different zones:

0x8140 to 0xa0fe Reserved for user-defined characters
0xa140 to 0xa3bf "Graphical characters"
0xa3c0 to 0xa3fe Reserved, "not" for user-defined characters
0xa440 to 0xc67e Frequently used characters
0xc6a1 to 0xc8fe Reserved for user-defined characters
0xc940 to 0xf9d5 Less frequently used characters
0xf9d6 to 0xfefe Reserved for user-defined characters

The "graphical characters" actually comprise punctuation marks, partial
punctuation marks (e.g., half of a dash, half of an ellipsis; see below),
dingbats, foreign characters, and other special characters (e.g.,
presentational "full width" forms, digits for Suzhou numerals, zhuyin fuhao,
etc.)

In most vendor extensions, extended characters are placed in the various
zones reserved for user-defined characters, each of which are normally
regarded as associated with the preceding zone. For example, additional
"graphical characters" (e.g., punctuation marks) would be expected to be
placed in the 0xa3c0��0xa3fe range, and additional logograms would be placed
in either the 0xc6a1��0xc8fe or the 0xf9d6��0xfefe range. Sometimes, this is
not possible due to the large number of extended characters to be added;
for example, Cyrillic letters and Japanese kana have been placed in the zone
associated with "frequently-used characters".

What a Big5 code actually encodes
Contrary to popular belief, an individual Big5 code does not always represent
a complete semantic unit. The Big5 codes of logograms are always logograms,
but codes in the "graphical characters" section are not always complete
"graphical characters". What Big5 encodes are particular graphical
representations of characters or part of characters that happen to fit in the
space taken by two monospaced ASCII characters. This is a property of
double-byte character sets as normally used in CJK (Chinese, Japanese, and
Korean) computing, and is not a unique problem of Big5.

(The above might need some explanation by putting it in historical perspective,
as it is theoretically incorrect: Back when text mode personal computing was
still the norm, characters were normally represented as single bytes and each
character takes one position on the screen. There was therefore a practical
reason to insist that double-byte characters must take up two positions on
the screen, namely that off-the-shelf, American-made software would then be
usable without modification in a DBCS-based system. If a character can take
an arbitrary number of screen positions, software which was written with the
assumption that one byte of text takes one screen position would produce
incorrect output. Of course, if a computer never had to deal with the text
screen, the manufacturer would not enforce this artificial restriction; the
Apple Macintosh is an example. Nevertheless, the encoding itself must be
designed so that it works correctly on text-screen-based systems.)

To illustrate this point, consider the Big5 code 0xa14b (...). To English
speakers this looks like an ellipsis and the Unicode standard identifies it
as such; however, in Chinese, the ellipsis consists of six dots that fit in
the space of two Chinese characters (......), so in fact there is no Big5
code for the Chinese ellipsis, and the Big5 code 0xa14b just represents half
of a Chinese ellipsis. It represents only half of an ellipsis because the
whole ellipsis should take the space of two Chinese characters, and in many
DBCS systems one DBCS character must take exactly the space of one Chinese
character.

Characters encoded in Big5 do not always represent things that can be readily
used in plain text files; an example is "citation mark" (0xa1ca), which is,
when used, required to be typeset under the title of literary works. Another
example is the Suzhou numerals, which is a form of scientific notation that
requires the number to be laid out in a 2-D form consisting of at least two
rows.

The Matching SBCS
In practice, Big5 cannot be used without a matching Single Byte Character Set
(SBCS); this is mostly to do with a compatibility reason. However, as in the
case of other CJK DBCS character sets, the SBCS to use has never been
specified. Big5 has always been defined as a DBCS, though when used it must
be paired with a suitable, unspecified SBCS and therefore used as what some
people call a MBCS; nevertheless, Big5 by itself, as defined, is strictly a
DBCS.

The SBCS to use being unspecified implies that the SBCS used can theoretically
vary from system to system. Nowadays, ASCII is the only possible SBCS one
would use. However, in old DOS-based systems, Code Page 437 --- with its
extra special symbols in the control code area including position 127 --- was
much more common. Yet, on a Macintosh system with the Chinese Language Kit,
or on a Unix system running the cxterm terminal emulator, the SBCS paired
with Big5 would not be Code Page 437.

Outside the valid range of Big5, the old DOS-based systems would routinely
interpret things according to the SBCS that is paired with Big5 on that system.
In such systems, characters 127 to 160, for example, were very likely not
avoided because they would produce invalid Big5, but used because they would
be valid characters in Code Page 437.

The modern characterization of Big5 as an MBCS consisting of the DBCS of Big5
plus the SBCS of ASCII is therefore historically incorrect and potentially
flawed, as the choice of the matching SBCS was, and theoretically still is,
quite independent of the flavour of Big5 being used.

History
The Big5 encoding was defined by the Institute for Information Industry of
Taiwan in 1984. The name "Big5" may derive from the five companies
(Acer, MiTAC, JiaJia, Zero One, FIC) that developed the standard, or it may
refer to the intended development and support of five major software packages.
[1] According to some accounts, Big5 was popularized by its adoption in
several commercial software packages, especially the ET Chinese system which
ran on MS-DOS.

The Republic of China government declared it their standard in mid-1980s
since Big5 was already the de facto standard by that time.

Extensions
The original Big-5 only include CJK logograms from Changyoung Gouzi Biaozhun
Zitibiao and Cichangyoung Gouzi Biaozhun Zitibiao, but not letters from
people's names, place names, dialects, chemistry, biology, Japanese kana.
As a result, many Big-5 supporting software include extensions to address the
problems.

Vendor Extensions

ETEN extensions
In ETEN Chinese operating system, the following code points are added to make
it compliant with IBM5550 code page:

A3C0-A3E0: 33 control characters.
C6A1-C875: circle 1-10, bracket 1-10, Roman letters 1-9 (i-ix), CJK radical glyphs, Japanese hiragana, Japanese katakana, Cyrillic characters 
F9D6-F9FE: 7 characters and 34 extra symbols.
In some versions of Eten, there are extra graphical symbols and Simplified
Chinese characters.

Microsoft code pages
Microsoft created its own version of Big5 extension as Code page 950 for use
with Microsoft Windows which supports ETEN's extensions, but only the
F9D6-F9FE code points. In Windows ME, the euro currency symbol is mapped to
Big-5 code point A3E1, but not in later versions of the operating system.

After installing Microsoft's HKSCS patch on top of traditional Chinese
Windows (or any version of Windows 2000 and above with proper language pack),
applications using code page 950 automatically use a hidden code page 951
table. The table supports all code points in HKSCS-2001, except for the
compatibility code points specified by the standard[2].

Code page 950 used by Windows 2000 and Windows XP maps hiragana and kanatana
characters to Unicode private use area block when exporting to Unicode,
but to the proper hiragana and kanatana Unicode blocks in Windows Vista.

ChinaSea font
ChinaSea fonts[3] are Traditional Chinese fonts made by ChinaSea. The fonts
are rarely sold separately, but are bundled with other products, such as the
Chinese version of Microsoft Office 97. The fonts support Japanese kana,
kokuji, and other characters missing in Big-5. As a result, the ChinaSea
extensions have become more popular than the government-supported extensions.
Some Hong Kong BBSes had used encodings in ChinaSea fonts before the
introduction of HKSCS.

'Sakura' font
The 'Sakura' font (Sakura Version) is developed in Hong Kong and is designed
to be compatible with HKSCS. It adds support for kokuji and proprietary
dingbats (including Doraemon) not found in HKSCS.

Unicode-at-on
Unicode-at-on, formerly BIG5 Extension, extends BIG-5 by altering code page
tables, but uses the ChinaSea extensions starting with version 2. However,
with the bankruptcy of ChinaSea, late development, and the increasing
popularity of HKSCS and Unicode (the project is not compatible with HKSCS),
the success of this extension is limited at best.

Despite the problems, characters previously mapped to Unicode Private Use Area
are remapped to the standardized equivalents when exporting characters to
Unicode format.

OPG
The web sites of the Oriental Daily News and Sun Daily, belongs to the
Oriental Press Group Limited in Hong Kong, use a downloadable font which the
Big-5 extension coding differ from the HKSCS.

Official Extensions

Taiwan Ministry of Education font
The Taiwan Ministry of Education supplied its own font, the Taiwan Ministry
of Education font for use internally.

Taiwan Council of Agriculture font
Taiwan's Council of Agriculture font, Executive Yuan introduced a
133-character custom font, the Taiwan Council of Agriculture font that
includes 84 characters from the 'fish' radical and 7 from the 'bird' radical.

Big5+
The Chinese Foundation for Digitization Technology introduced Big5+ in 1997,
which used over 20000 code points to incorporate all CJK logograms in Unicode
1.1. However, the extra code points exceeded the original Big-5 definition
(Big5+ uses high byte values 81-FE and low byte values 40-7E and 80-FE),
preventing it from being installed on Microsoft Windows.

Big-5E
To allow Windows users to use custom fonts, the Chinese Foundation for
Digitization Technology introduced Big-5E, which included 3954 characters.
The system is incompatible with Big5+ and removed the Japanese kana from the
ETEN extension, so it became unpopular.

Big5-2003
The Chinese Foundation for Digitization Technology made a Big5 definition and
put it into CNS 11643 in note form, making it part of the official standard
in Taiwan.

Big5-2003 incorporates all Big-5 characters introduced in the 1984 ETEN
extensions (code points A3C0-A3E0, C6A1-C7F2, and F9D6-F9FE) and the Euro
symbol. Cyrillic characters were not included because the authority claimed
CNS 11643 does not include such characters.

CDP
The Academia Sinica made a CDP font in late 90s, which the latest release
version 2.5 included 112,533 characters, some less than the Mojikyo fonts.

HKSCS
Hong Kong also adopted Big5 for character encoding. However, Cantonese uses
many archaic and some colloquial Chinese characters that were not available
in the normal Big5 character set. To solve this problem, the Hong Kong
Government created the Big5 extensions Government Chinese Character Set in
1995 and Hong Kong Supplementary Character Set in 1999. The Hong Kong
extensions were commonly distributed as a patch. It is still being distributed
as a patch by Microsoft, but a full Unicode font is also available from the
Hong Kong Government�fs web site.

There are two encoding schemes of HKSCS: one encoding scheme is for the Big-5
coding standard and the other is for the ISO 10646 standard. Subsequent to
the initial release, there are also HKSCS-2001 and HKSCS-2004. The HKSCS-2004
is aligned technically with the ISO/IEC 10646:2003 and its Amendment 1
published in April 2004 by the International Organization for Standardization
(ISO).

HKSCS includes all the characters from the common ETEN extension, plus some
characters from Simplified Chinese, place names, people's names, and
Cantonese phrases (including profanity).

=head1 "Big5Plus" IN THIS SOFTWARE

 The "Big5Plus" in this software means widely codeset than general Big5Plus.
This software use two algorithms to handle Big5Plus.

=over 2

=item * ALGORITHM #1

 When the character is taken out of the octet string, it is necessary to
distinguish a single octet character and the double octet character.
The distinction is done only by first octet.

    Single octet code is:
      0x00-0x80 and 0xFF

    Double octet code is:
      First octet   0x81-0xFE
      Second octet  0x00-0xFF (All octet)

    MALFORMED single octet code is:
      0x81-0xFE
      * Final octet of string like first octet of double octet code

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
 A| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | | | |*| 0xFF
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
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0xFE    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


    *MALFORMED* Single octet code

Final octet of string like first octet of double octet code

Even if malformed, it is not ignored and not deleted automatically.
For example, Esjis::chop function returns this octet.

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
 8| |M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| 0x81-0xFE
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

=item * ALGORITHM #2

Against algorithm.1, when the range of the character by tr/// is specified, only the
following character codes are effective.

    Single octet code is:
      0x00-0x80 and 0xFF

    Double octet code is:
      First octet   0x81-FE
      Second octet  0x40-0x7E and 0x80-0xFE

For instance, [\x81\x00-\x82\xFF] in script means [\x81\x82][\x40-\x7E\x80-\xFE].

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
 A| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | | | |*| 0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                 Double octet code
            First octet                                     Second octet

   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x40-0x7E
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0xFE    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x80-0xFE
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=back

=head1 SEE ALSO

perl, esjis.pl

=cut
