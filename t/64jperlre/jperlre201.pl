use Sjis;

if ('アABC DEF GHI' =~ /\bABC/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bABC/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bABC/)\n";
}

if ('アABC DEF GHI' =~ /\bDEF/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bDEF/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bDEF/)\n";
}

if ('アABC DEF GHI' =~ /\bGHI/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bGHI/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /\\bGHI/)\n";
}

if ('アABC DEF GHI' =~ /ABC\b/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /ABC\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /ABC\\b/)\n";
}

if ('アABC DEF GHI' =~ /DEF\b/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /DEF\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /DEF\\b/)\n";
}

if ('アABC DEF GHI' =~ /GHI\b/) {
    print "ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /GHI\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('アABC DEF GHI' =~ /GHI\\b/)\n";
}

__END__
