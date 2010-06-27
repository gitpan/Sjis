# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

eval q< '-' =~ /(‚ [‚¢-‚ ])/ >;
if ($@) {
    print "ok - 1 $^X 149_jperlre.t die ('-' =~ /‚ [‚¢-‚ ]/).\n";
}
else {
    print "not ok - 1 $^X 149_jperlre.t die ('-' =~ /‚ [‚¢-‚ ]/).\n";
}

__END__
