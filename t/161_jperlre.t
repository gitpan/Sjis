# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ -‚¢' =~ /(‚ \s‚¢)/) {
    print "not ok - 1 $^X jperlre060.pl not ('‚ -‚¢' =~ /‚ \s‚¢/).\n";
}
else {
    print "ok - 1 $^X jperlre060.pl not ('‚ -‚¢' =~ /‚ \s‚¢/).\n";
}

__END__
