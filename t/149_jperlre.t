# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

print "1..1\n";

my $__FILE__ = __FILE__;

if ($^O eq 'MacOS') {
    print "ok - 1 # SKIP $^X $0\n";
    exit;
}

my $null = '';
if ($^O =~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    $null = 'NUL';
}
elsif ($^O eq 'MacOS') {

    # ISBN4-7561-3068-2
    # MacPerl 入門 Chapter 7
    # P.131 標準I/Oのリダイレクト

    $null = 'Dev:Null';
}
else{
    $null = '/dev/null';
}

my $script = __FILE__ . '.pl';
open(TEST,">$script") || die "Can't open file: $script\n";
print TEST <DATA>;
close(TEST);

if (system(qq{$^X $script 2>$null}) != 0) {
    print "ok - 1 $^X $__FILE__ die ('-' =~ /あ[い-あ]/).\n";
}
else {
    print "not ok - 1 $^X $__FILE__ die ('-' =~ /あ[い-あ]/).\n";
}

__END__
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

'-' =~ /(あ[い-あ])/;

exit 0;
