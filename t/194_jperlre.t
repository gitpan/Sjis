# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..6\n";

if ('�AABC DEF GHI' =~ /\bABC/) {
    print "ok - 1 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bABC/)\n";
}
else {
    print "not ok - 1 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bABC/)\n";
}

if ('�AABC DEF GHI' =~ /\bDEF/) {
    print "ok - 2 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bDEF/)\n";
}
else {
    print "not ok - 2 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bDEF/)\n";
}

if ('�AABC DEF GHI' =~ /\bGHI/) {
    print "ok - 3 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bGHI/)\n";
}
else {
    print "not ok - 3 $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bGHI/)\n";
}

if ('�AABC DEF GHI' =~ /ABC\b/) {
    print "ok - 4 $^X jperlre201.pl ('�AABC DEF GHI' =~ /ABC\\b/)\n";
}
else {
    print "not ok - 4 $^X jperlre201.pl ('�AABC DEF GHI' =~ /ABC\\b/)\n";
}

if ('�AABC DEF GHI' =~ /DEF\b/) {
    print "ok - 5 $^X jperlre201.pl ('�AABC DEF GHI' =~ /DEF\\b/)\n";
}
else {
    print "not ok - 5 $^X jperlre201.pl ('�AABC DEF GHI' =~ /DEF\\b/)\n";
}

if ('�AABC DEF GHI' =~ /GHI\b/) {
    print "ok - 6 $^X jperlre201.pl ('�AABC DEF GHI' =~ /GHI\\b/)\n";
}
else {
    print "not ok - 6 $^X jperlre201.pl ('�AABC DEF GHI' =~ /GHI\\b/)\n";
}

__END__
