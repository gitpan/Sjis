# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# エラーにはならないけど文字化けする（３）
print "丸十net";

__END__

esjis.pl の処理結果が以下になることを期待している

print "丸十\net";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
