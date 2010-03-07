# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# dbmopen
my %DBM;
if (dbmopen(%DBM,'F‹@”\',0777)) {
    print "ok - dbmopen $^X $__FILE__\n";
    dbmclose(%DBM);
}
else {
    print "not ok - dbmopen: $! $^X $__FILE__\n";
}
system('del F*.* >NUL 2>NUL');

__END__
