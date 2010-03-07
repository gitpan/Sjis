# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

system("echo 1 > F機能");

# do
if (do 'F機能') {
    print "ok - do $^X $__FILE__\n";
}
else {
    print "not ok - do: $! $^X $__FILE__\n";
}

__END__
