# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

use Sjis;

my $cwd1 = `chdir`;
eval {
    chdir('directory');
};
if ($@) {
    print "not ok - chdir (1/2)\n";
}
else {
    my $cwd2 = `chdir`;
    if ($cmd1 ne $cwd2) {
        print "ok - chdir (1/2)\n";
        chdir('..');
    }
    else {
        print "not ok - chdir (1/2)\n";
    }
}

# chdir must die
eval {
    chdir('D‹@”\');
};
if ($@) {
    print "ok - chdir (2/2)\n";
}
else {
    print "not ok - chdir (2/2)\n";
}

__END__

