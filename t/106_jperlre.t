# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('x������y' =~ /(������)/) {
    if ("$1" eq "������") {
        print "ok - 1 $^X jperlre005.pl ('x������y' =~ /������/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre005.pl ('x������y' =~ /������/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre005.pl ('x������y' =~ /������/).\n";
}

__END__
