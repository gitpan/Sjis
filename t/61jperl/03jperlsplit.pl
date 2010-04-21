use Sjis;

#
# split
#
@X = split(/(.)/, "abcde");
if ($#X != 9) {
    print "not ok - 1 $^X 03jperlsplit.pl\n";
}
else {
    print "ok - 1 $^X 03jperlsplit.pl\n";
}

__END__
