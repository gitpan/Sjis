# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# opendir
if (opendir(DIR,'D‹@”\')) {
    print "ok - opendir\n";
    closedir(DIR);
}
else {
    print "not ok - opendir: $!\n";
}

__END__
