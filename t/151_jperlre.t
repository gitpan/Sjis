# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

eval q< '-' =~ /(��[)/ >;
if ($@) {
    print "ok - 1 $^X jperlre050.pl die ('-' =~ /��[/).\n";
}
else {
    print "not ok - 1 $^X jperlre050.pl die ('-' =~ /��[/).\n";
}

__END__
