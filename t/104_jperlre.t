# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あxう' =~ /(あいう)/) {
    print "not ok - 1 $^X jperlre003.pl not ('あxう' =~ /あいう/).\n";
}
else {
    print "ok - 1 $^X jperlre003.pl not ('あxう' =~ /あいう/).\n";
}

__END__
