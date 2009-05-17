for my $smoke (split(/\n/,`dir /b smoke-*.pl 2>NUL`)) {
    system("perl $smoke");
}

system("perl try-smoke.pl");

