# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# エラーにはならないけど文字化けする（２）
print q(ミソ\500);

__END__

esjis.pl の処理結果が以下になることを期待している

print q(ミソ\\500);

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
