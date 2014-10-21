# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..7\n";

if ('ABC DEF GHI' =~ /\BABC/) {
    print "not ok - 1 $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "ok - 1 $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}

if ('�AABC DEF GHI' =~ /\BABC/) {
    print "ok - 2 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "not ok - 2 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BABC/)\n";
}

if ('�AABC DEF GHI' =~ /\BDEF/) {
    print "not ok - 3 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BDEF/)\n";
}
else {
    print "ok - 3 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BDEF/)\n";
}

if ('�AABC DEF GHI' =~ /\BGHI/) {
    print "not ok - 4 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BGHI/)\n";
}
else {
    print "ok - 4 $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BGHI/)\n";
}

if ('�AABC DEF GHI' =~ /ABC\B/) {
    print "not ok - 5 $^X jperlre202.pl ('�AABC DEF GHI' =~ /ABC\\B/)\n";
}
else {
    print "ok - 5 $^X jperlre202.pl ('�AABC DEF GHI' =~ /ABC\\B/)\n";
}

if ('�AABC DEF GHI' =~ /DEF\B/) {
    print "not ok - 6 $^X jperlre202.pl ('�AABC DEF GHI' =~ /DEF\\B/)\n";
}
else {
    print "ok - 6 $^X jperlre202.pl ('�AABC DEF GHI' =~ /DEF\\B/)\n";
}

if ('�AABC DEF GHI' =~ /GHI\B/) {
    print "not ok - 7 $^X jperlre202.pl ('�AABC DEF GHI' =~ /GHI\\B/)\n";
}
else {
    print "ok - 7 $^X jperlre202.pl ('�AABC DEF GHI' =~ /GHI\\B/)\n";
}

__END__
