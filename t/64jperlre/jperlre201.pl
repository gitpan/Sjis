use Sjis;

if ('�AABC DEF GHI' =~ /\bABC/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bABC/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bABC/)\n";
}

if ('�AABC DEF GHI' =~ /\bDEF/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bDEF/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bDEF/)\n";
}

if ('�AABC DEF GHI' =~ /\bGHI/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bGHI/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /\\bGHI/)\n";
}

if ('�AABC DEF GHI' =~ /ABC\b/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /ABC\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /ABC\\b/)\n";
}

if ('�AABC DEF GHI' =~ /DEF\b/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /DEF\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /DEF\\b/)\n";
}

if ('�AABC DEF GHI' =~ /GHI\b/) {
    print "ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /GHI\\b/)\n";
}
else {
    print "not ok - $^X jperlre201.pl ('�AABC DEF GHI' =~ /GHI\\b/)\n";
}

__END__
