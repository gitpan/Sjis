use Sjis;

if ('ABC DEF GHI' =~ /\BABC/) {
    print "not ok - $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}

if ('�AABC DEF GHI' =~ /\BABC/) {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BABC/)\n";
}

if ('�AABC DEF GHI' =~ /\BDEF/) {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BDEF/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BDEF/)\n";
}

if ('�AABC DEF GHI' =~ /\BGHI/) {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BGHI/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /\\BGHI/)\n";
}

if ('�AABC DEF GHI' =~ /ABC\B/) {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /ABC\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /ABC\\B/)\n";
}

if ('�AABC DEF GHI' =~ /DEF\B/) {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /DEF\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /DEF\\B/)\n";
}

if ('�AABC DEF GHI' =~ /GHI\B/) {
    print "not ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /GHI\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('�AABC DEF GHI' =~ /GHI\\B/)\n";
}

__END__
