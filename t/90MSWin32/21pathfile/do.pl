# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

system("echo 1 > F�@�\");

# do
if (do 'F�@�\') {
    print "ok - do $^X $__FILE__\n";
}
else {
    print "not ok - do: $! $^X $__FILE__\n";
}

__END__
