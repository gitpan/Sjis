# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

my $filetest;

$_ = 'F機能';

$filetest = -d $_;
if ($filetest) {
    print "not ok - 04filetest.pl (1/6) $^X $__FILE__\n";
}
else {
    print "ok - 04filetest.pl (1/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "ok - 04filetest.pl (2/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (2/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 04filetest.pl (3/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (3/6) $^X $__FILE__\n";
}

$_ = 'D機能';

$filetest = -d $_;
if ($filetest) {
    print "ok - 04filetest.pl (4/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (4/6) $^X $__FILE__\n";
}

$filetest = -f $_;
if ($filetest) {
    print "not ok - 04filetest.pl (5/6) $^X $__FILE__\n";
}
else {
    print "ok - 04filetest.pl (5/6) $^X $__FILE__\n";
}

$filetest = -e $_;
if ($filetest) {
    print "ok - 04filetest.pl (6/6) $^X $__FILE__\n";
}
else {
    print "not ok - 04filetest.pl (6/6) $^X $__FILE__\n";
}

__END__

Perlメモ/Windowsでのファイルパス
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

ファイル関連コマンドの動作確認
「機能」という文字列を変数$_に入れ、ファイル演算子-d、-f、-e等でチェックすると、いずれも常にundefを返す

