use Sjis;

if ('ABC DEF GHI' =~ /\BABC/) {
    print "not ok - $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('ABC DEF GHI' =~ /\\BABC/)\n";
}

if ('アABC DEF GHI' =~ /\BABC/) {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BABC/)\n";
}
else {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BABC/)\n";
}

if ('アABC DEF GHI' =~ /\BDEF/) {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BDEF/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BDEF/)\n";
}

if ('アABC DEF GHI' =~ /\BGHI/) {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BGHI/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /\\BGHI/)\n";
}

if ('アABC DEF GHI' =~ /ABC\B/) {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /ABC\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /ABC\\B/)\n";
}

if ('アABC DEF GHI' =~ /DEF\B/) {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /DEF\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /DEF\\B/)\n";
}

if ('アABC DEF GHI' =~ /GHI\B/) {
    print "not ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /GHI\\B/)\n";
}
else {
    print "ok - $^X jperlre202.pl ('アABC DEF GHI' =~ /GHI\\B/)\n";
}

__END__
