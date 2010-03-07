# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

# unlink
if (unlink('F機能')) {
    print "ok - unlink $^X $__FILE__\n";
    system('echo 1>F機能');
}
else {
    print "not ok - unlink: $! $^X $__FILE__\n";
}

__END__
