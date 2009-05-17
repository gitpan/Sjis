# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# dbmopen
my %DBM;
if (dbmopen(%DBM,'F‹@”\',0777)) {
    print "ok - dbmopen\n";
    dbmclose(%DBM);
}
else {
    print "not ok - dbmopen: $!\n";
}
system('del F*.* >NUL 2>NUL');

__END__
