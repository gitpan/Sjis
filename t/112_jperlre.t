# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(.{1})/) {
    if ("$1" eq "‚ ") {
        print "ok - 1 $^X jperlre011.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{1}/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre011.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{1}/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre011.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{1}/).\n";
}

__END__
