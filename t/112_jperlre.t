# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あいいいいう' =~ /(.{1})/) {
    if ("$1" eq "あ") {
        print "ok - 1 $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
}

__END__
