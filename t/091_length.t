# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..2\n";

my $__FILE__ = __FILE__;

if (length('����������') == 10) {
    print qq{ok - 1 length('����������') == 10 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 length('����������') == 10 $^X $__FILE__\n};
}

if (Sjis::length('����������') == 5) {
    print qq{ok - 2 Sjis::length('����������') == 5 $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 Sjis::length('����������') == 5 $^X $__FILE__\n};
}

__END__
