# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あ-い' =~ /あ[-]い/) {
    print "ok - 1 $^X jperlre101.pl ('あ-い' =~ /あ[-]い/)\n";
}
else {
    print "not ok - 1 $^X jperlre101.pl ('あ-い' =~ /あ[-]い/)\n";
}

__END__
