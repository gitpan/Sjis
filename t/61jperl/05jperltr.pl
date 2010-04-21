use Sjis;

#
# tr
#
$y = "‚ ‚¢‚¤‚¦‚¨";
$y =~ tr/‚ -‚¤//cd;
if ($y ne "‚ ‚¢‚¤") {
    print "not ok - 1 $^X 05jperltr.pl\n";
}
else {
    print "ok - 1 $^X 05jperltr.pl\n";
}

$y = "‚ ‚¢‚¤‚¦‚¨";
$y =~ tr/‚ -‚¤/‚©-‚­/;
if ($y ne "‚©‚«‚­‚¦‚¨") {
    print "not ok - $^X 2 05jperltr.pl\n";
}
else {
    print "ok - 2 $^X 05jperltr.pl\n";
}

$y = 'abcabcabc';
$y =~ tr/a-c/d-f/;
if ($y ne 'defdefdef') {
    print "not ok - 3 $^X 05jperltr.pl\n";
}
else {
    print "ok - 3 $^X 05jperltr.pl\n";
}

$y = 'abc';
$y =~ tr/abc/def/;
if ($y ne 'def') {
    print "not ok - 4 $^X 05jperltr.pl\n";
}
else {
    print "ok - 4 $^X 05jperltr.pl\n";
}

$y = 'abcabcabc';
$y =~ tr/abc/def/;
if ($y ne 'defdefdef') {
    print "not ok - 5 $^X 05jperltr.pl\n";
}
else {
    print "ok - 5 $^X 05jperltr.pl\n";
}

__END__
