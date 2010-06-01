# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ ‚¢‚¦' =~ /(‚ [‚¢-‚¦]e)/) {
    print "not ok - 1 $^X jperlre043.pl not ('‚ ‚¢‚¦' =~ /‚ [‚¢-‚¦]e/).\n";
}
else {
    print "ok - 1 $^X jperlre043.pl not ('‚ ‚¢‚¦' =~ /‚ [‚¢-‚¦]e/).\n";
}

__END__
