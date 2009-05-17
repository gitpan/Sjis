# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# Can't find string terminator '"' anywhere before EOF
# 「終端文字 '"'がファイルの終り EOF までに見つからなかった」
print "対応表";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "対応表\";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
