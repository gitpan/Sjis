# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('あいえ' =~ /(あ[い-え]e)/) {
    print "not ok - 1 $^X $__FILE__ not ('あいえ' =~ /あ[い-え]e/).\n";
}
else {
    print "ok - 1 $^X $__FILE__ not ('あいえ' =~ /あ[い-え]e/).\n";
}

__END__
