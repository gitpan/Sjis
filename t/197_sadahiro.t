# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..10\n";

# �P�ꋫ�E���������^���� C<\b> ����� C<\B> �͐��������삵�܂���B

if ('ABC �ADEF GHI' =~ /\bDEF/) {
    print "ok - 1 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bDEF/)\n";
}
else {
    print "not ok - 1 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bDEF/)\n";
}

if ('ABC �ADEF GHI' =~ /DEF\b/) {
    print "ok - 2 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /DEF\\b/)\n";
}
else {
    print "not ok - 2 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /DEF\\b/)\n";
}

if ('ABC �ADEF GHI' =~ /\bDEF\b/) {
    print "ok - 3 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bDEF\\b/)\n";
}
else {
    print "not ok - 3 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bDEF\\b/)\n";
}

if ('ABC �ADEF GHI' =~ /\bABC/) {
    print "ok - 4 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bABC/)\n";
}
else {
    print "not ok - 4 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\bABC/)\n";
}

if ('ABC �ADEF GHI' =~ /GHI\b/) {
    print "ok - 5 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /GHI\\b/)\n";
}
else {
    print "not ok - 5 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /GHI\\b/)\n";
}

if ('ABC �ADEF GHI' =~ /\B�ADEF G/) {
    print "ok - 6 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\B�ADEF G/)\n";
}
else {
    print "not ok - 6 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\B�ADEF G/)\n";
}

if ('ABC �ADEF GHI' =~ /�ADEF G\B/) {
    print "ok - 7 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /�ADEF G\\B/)\n";
}
else {
    print "not ok - 7 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /�ADEF G\\B/)\n";
}

if ('ABC �ADEF GHI' =~ /\B�ADEF G\B/) {
    print "ok - 8 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\B�ADEF G\\B/)\n";
}
else {
    print "not ok - 8 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\B�ADEF G\\B/)\n";
}

if ('ABC �ADEF GHI' =~ /\BABC/) {
    print "not ok - 9 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\BABC/)\n";
}
else {
    print "ok - 9 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /\\BABC/)\n";
}

if ('ABC �ADEF GHI' =~ /GHI\B/) {
    print "not ok - 10 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /GHI\\B/)\n";
}
else {
    print "ok - 10 $^X 02sadahiro.pl ('ABC �ADEF GHI' =~ /GHI\\B/)\n";
}

__END__

http://search.cpan.org/dist/ShiftJIS-Regexp/
