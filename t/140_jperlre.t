# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = ___FILE__;

if ('��xyz��' =~ /(��.*��)/) {
    if ("$1" eq "��xyz��") {
        print "ok - 1 $^X $___FILE__ ('��xyz��' =~ /��.*��/).\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__ ('��xyz��' =~ /��.*��/).\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__ ('��xyz��' =~ /��.*��/).\n";
}

__END__
