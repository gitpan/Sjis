use Sjis;

#
# split
#
@X = split(/(.)/, "あいうtえお");
$x = $#X;
if ($x != 11) {
    print "not ok - 1 $^X 04jperlsplit.pl\n";
}
else {
    print "ok - 1 $^X 04jperlsplit.pl\n";
}

__END__
