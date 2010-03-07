# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# マッチするはずなのにマッチしない（１）
if ("運転免許" =~ m'運転') {
    print 1;
}
else {
    print 0;
}

__END__

Sjis.pm で処理したスクリプトの実行結果が以下になることを期待している

1

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
