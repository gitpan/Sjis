# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# エラーにはならないけど文字化けする（１）
print "暴力";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "暴\力";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
