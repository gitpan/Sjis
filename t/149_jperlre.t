# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

eval q< '-' =~ /(あ[い-あ])/ >;
if ($@) {
    print "ok - 1 $^X 149_jperlre.t die ('-' =~ /あ[い-あ]/).\n";
}
else {
    print "not ok - 1 $^X 149_jperlre.t die ('-' =~ /あ[い-あ]/).\n";
}

__END__
