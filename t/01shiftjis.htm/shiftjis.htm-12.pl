# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# Bareword found where operator expected
# 「裸の語が演算子があってほしい位置に見つかった」
print "<img alt=\"対応表\" height=115 width=150>";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "<img alt=\"対応表\\" height=115 width=150>";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
