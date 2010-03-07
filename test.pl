# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

# BEGIN { $| = 1; print "1..1\n"; }
# use Sjis;
# print "ok 1\n";

$| = 1;
use Cwd;

my $cwd = cwd();
$cwd =~ s#/#\\#g;

my @test = sort split(/\n/,`dir /s /b t\\test.pl 2>NUL`);
for my $test (@test) {
    if (($test =~ m/MSWin32/oxms) and ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms)) {
        next;
    }
    print STDERR "Testing $test...\n";

    my $testdir = $test;
    $testdir =~ s#\\([^\\]*)$##;
    chdir $testdir;

    system $^X, 'test.pl';
}

chdir $cwd;

my @unlink = sort split(/\n/,`dir /s /b t\\*.pl.e 2>NUL`);
for my $unlink (@unlink) {
    unlink $unlink;
}

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

