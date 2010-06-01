# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ xyz‚¤' =~ /(‚ .*‚¤)/) {
    if ("$1" eq "‚ xyz‚¤") {
        print "ok - 1 $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
}

__END__
