use strict;
use Cwd;
my $homedir = cwd();
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

for my $smoke (split(/\n/,`dir /b smoke-*.pl 2>NUL`)) {
    system("perl $smoke");
}

system("perl try-smoke.pl");

END {
    if (defined $homedir) {
        chdir($homedir);
    }
}

