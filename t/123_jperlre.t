# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいいいいう' =~ /(あい{4,5}いう)/) {
    print "not ok - 1 $^X jperlre022.pl not ('あいいいいう' =~ /あい{4,5}いう/).\n";
}
else {
    print "ok - 1 $^X jperlre022.pl not ('あいいいいう' =~ /あい{4,5}いう/).\n";
}

__END__
