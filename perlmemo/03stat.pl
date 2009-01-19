# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

$_ = 'F機能';
if (@_ = stat($_)) {
    print "ok - perl 03stat.pl (1/2)\n";
}
else{
    print "not ok - perl 03stat.pl (1/2)\n";
}

$_ = 'D機能';
if (@_ = stat($_)) {
    print "not ok - perl 03stat.pl (2/2)\n";
}
else{
    print "ok - perl 03stat.pl (2/2)\n";
}

__END__

Perlメモ/Windowsでのファイルパス
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

ファイル関連コマンドの動作確認
「機能」という文字列を変数$_に入れ、stat($_)としても返り値がない 

