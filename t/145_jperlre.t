# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('����e' =~ /(��[��-��]e)/) {
    if ("$1" eq "����e") {
        print "ok - 1 $^X $__FILE__ ('����e' =~ /��[��-��]e/).\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__ ('����e' =~ /��[��-��]e/).\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__ ('����e' =~ /��[��-��]e/).\n";
}

__END__
