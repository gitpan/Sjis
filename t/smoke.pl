use strict;
use Cwd;
my $homedir= cwd();
$| = 1;

if (-d 't') {
    chdir('t');
    if (not -e '..\\esjis.pl') {
        die "script esjis.pl not found.\n";
    }
}
else {
    die "Can't chdir('t').\n";
}

my $m = 1;
# if (($m) = $0 =~ /smoke\.m(\d+)\.(pl|t)$/i) {
#     print STDERR "mile = $m.\n";
# }
# else {
#     die "$0: mile unknown.\n";
# }

my $test = '';

if ($m == 1) {
    for my $smoke (split(/\n/,`dir /b smoke-*.pl 2>NUL`)) {
next if $test and $smoke !~ /\b$test\b/;

        system("perl $smoke");
    }
}

my($year,$month,$day,$hour,$min,$sec) = (localtime)[5,4,3,2,1,0];
my $time = sprintf('%04d%02d%02d-%02d%02d%02d', 1900+$year,$month+1,$day,$hour,$min,$sec);
open(SMOKE,">smoke.$time.log") || die "Can't open file: smoke.$time.log";

my $diff = 0;
my %diff_file = ();

for my $dir (split(/\n/,`dir /ad /b *.* 2>NUL`)) {

    for my $script (split(/\n/,`dir /s /b $dir\\*.pl 2>NUL`)) {
next if $test and $script !~ /\b$test\b/;

        my $basemile = $script;
        if ($m >= 2) {
            $basemile = "$basemile.m" . ($m - 1);
        }
        my $mile = "$script.m$m";

        print STDERR $script, "\n";
        my $rc1 = system("perl ..\\esjis.pl $script > $mile");

        if ($rc1 == 0) {
            print SMOKE "ok - esjis.pl $script > $mile\n";
        }
        else {
            print SMOKE "not ok - (rc=$rc1) esjis.pl $script > $mile\n";
        }

        my $rc2 = system("perl -c $mile");
        if ($rc2 == 0) {
            print SMOKE "ok - perl -c $mile\n";
        }
        else {
            print SMOKE "not ok - (rc=$rc2) perl -c $mile\n";
        }
    }
}

close(SMOKE);

if ($m >= 2) {
    print STDERR "diff count = $diff\n";
    print STDERR "diff files = ", scalar(keys %diff_file), "\n";
}

END {
    chdir($homedir);
}

