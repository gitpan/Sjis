# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;
print "1..1\n";

my $chcp = `chcp`;
if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms or $chcp !~ /932/oxms) {
    print "ok - 1 # SKIP $^X $0\n";
    exit;
}

open(FILE,'>F�@�\') || die "Can't open file: F�@�\\n";
print FILE "1\n";
close(FILE);

# system
if (system('dir /b F�@�\ >NUL 2>NUL') == 0) {
    print "ok - 1 system $^X $__FILE__\n";
}
else {
    print "not ok - 1 system: $! $^X $__FILE__\n";
}

unlink('F�@�\');

__END__
