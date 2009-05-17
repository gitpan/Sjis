# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

# BEGIN { $| = 1; print "1..1\n"; }
# use Sjis;
# print "ok 1\n";

for my $testdir (sort split(/\n/,`dir /ad /b 2>NUL`)) {
    next if $testdir eq 't';

    if (($testdir =~ m/\A [a-z] /oxms) and (-f "$testdir/test.pl")) {
        print STDERR "Testing $testdir/test.pl...\n";
        chdir $testdir;
        system $^X, 'test.pl';
        chdir '..';
    }
}

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

