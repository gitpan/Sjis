# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

system('echo 1 > F�@�\');
system('del file 2>NUL');

# rename (1/3)
if (rename('F�@�\','file')) {
    print "ok - rename (1/3) $^X $__FILE__\n";
}
else {
    print "not ok - rename: $! $^X $__FILE__\n";
}

# rename (2/3)
if (rename('file','F�@�\')) {
    print "ok - rename (2/3) $^X $__FILE__\n";
}
else {
    print "not ok - rename: $! $^X $__FILE__\n";
}

# rename (3/3)
if (rename('F�@�\','F2�@�\')) {
    print "ok - rename (3/3) $^X $__FILE__\n";
    system('del F2�@�\ 2>NUL');
}
else {
    print "not ok - rename: $! $^X $__FILE__\n";
}

__END__
