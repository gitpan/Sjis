# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ x‚¤' =~ /(‚ .‚¤)/) {
    if ("$1" eq "‚ x‚¤") {
        print "ok - 1 $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
}

__END__
