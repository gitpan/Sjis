# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

eval q!'AAA' =~ /[]/!;
if ($@) {
    print "ok - 1 $^X jperlre110.pl (!'AAA' =~ /[]/!)\n";
}
else {
    print "not ok - 1 $^X jperlre110.pl (!'AAA' =~ /[]/!)\n";
}

__END__
