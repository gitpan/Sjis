# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

# chdir
$cwd1 = `chdir`;
chdir('D‹@”\');
$cwd2 = `chdir`;
if ($cwd1 ne $cwd2) {
    print "ok - chdir\n";
    chdir('..');
}
else {
    print "not ok - chdir\n";
}

__END__
