# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# エラーにはならないけど文字化けする（５）
print lc('アイウエオ');

__END__

Sjis.pm の処理結果が以下になることを期待している

print Esjis::lc('アイウエオ');

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
