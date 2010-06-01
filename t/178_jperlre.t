# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚¦ef' =~ /(()ef)/) {
    if ("$1-$2" eq "ef-") {
        print "ok - 1 $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
}

__END__
