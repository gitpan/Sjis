# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あ い' =~ /(あ\sい)/) {
    if ("-" eq "-") {
        print "ok - 1 $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
}

__END__
