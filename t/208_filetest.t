# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;
print "1..6\n";

if ($^O !~ /\A (?: MSWin32 | NetWare | symbian | dos ) \z/oxms) {
    print "ok - 1 # SKIP $^X $0\n";
    print "ok - 2 # SKIP $^X $0\n";
    print "ok - 3 # SKIP $^X $0\n";
    print "ok - 4 # SKIP $^X $0\n";
    print "ok - 5 # SKIP $^X $0\n";
    print "ok - 6 # SKIP $^X $0\n";
    exit;
}

open(FILE,'>F機能') || die "Can't open file: F機能\n";
print FILE "1\n";
close(FILE);
mkdir('D機能', 0777);
open(FILE,'>D機能/a.txt') || die "Can't open file: D機能/a.txt\n";
print FILE "1\n";
close(FILE);
open(FILE,'>D機能/b.txt') || die "Can't open file: D機能/b.txt\n";
print FILE "1\n";
close(FILE);
open(FILE,'>D機能/c.txt') || die "Can't open file: D機能/c.txt\n";
print FILE "1\n";
close(FILE);
open(FILE,'>D機能/F機能') || die "Can't open file: D機能/F機能\n";
print FILE "1\n";
close(FILE);
mkdir('D機能/D機能', 0777);

my $filetest;

$_ = 'F機能';

$filetest = -d $_;
if ($filetest) {
    print "not ok - 1 04filetest.pl (1/6) $^X $__FILE__\n";
}
else {
    print "ok - 1 04filetest.pl (1/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "ok - 2 04filetest.pl (2/6) $^X $__FILE__\n";
}
else {
    print "not ok - 2 04filetest.pl (2/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 3 04filetest.pl (3/6) $^X $__FILE__\n";
}
else {
    print "not ok - 3 04filetest.pl (3/6) $^X $__FILE__\n";
}

$_ = 'D機能';

$filetest = -d $_;
if ($filetest) {
    print "ok - 4 04filetest.pl (4/6) $^X $__FILE__\n";
}
else {
    print "not ok - 4 04filetest.pl (4/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "not ok - 5 04filetest.pl (5/6) $^X $__FILE__\n";
}
else {
    print "ok - 5 04filetest.pl (5/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 6 04filetest.pl (6/6) $^X $__FILE__\n";
}
else {
    print "not ok - 6 04filetest.pl (6/6) $^X $__FILE__\n";
}

unlink('F機能');
rmdir('D機能/D機能');
unlink('D機能/a.txt');
unlink('D機能/b.txt');
unlink('D機能/c.txt');
unlink('D機能/F機能');
rmdir('D機能');

__END__

Perlメモ/Windowsでのファイルパス
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

ファイル関連コマンドの動作確認
「機能」という文字列を変数$_に入れ、ファイル演算子-d、-f、-e等でチェックすると、いずれも常にundefを返す

