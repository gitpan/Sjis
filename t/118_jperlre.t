# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいq' =~ /(あい{1,}いう)/) {
    print "not ok - 1 $^X jperlre017.pl not ('あいq' =~ /あい{1,}いう/).\n";
}
else {
    print "ok - 1 $^X jperlre017.pl not ('あいq' =~ /あい{1,}いう/).\n";
}

__END__
