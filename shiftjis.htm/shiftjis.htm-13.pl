# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# Unrecognized character \x82
# 「認識されない文字 \x82」
print "対応表", "なんでもいいけど";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "対応表\", "なんでもいいけど";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
