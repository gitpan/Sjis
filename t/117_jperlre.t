# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ ‚¢q' =~ /(‚ ‚¢+‚¢‚¤)/) {
    print "not ok - 1 $^X jperlre016.pl not ('‚ ‚¢q' =~ /‚ ‚¢+‚¢‚¤/).\n";
}
else {
    print "ok - 1 $^X jperlre016.pl not ('‚ ‚¢q' =~ /‚ ‚¢+‚¢‚¤/).\n";
}

__END__
