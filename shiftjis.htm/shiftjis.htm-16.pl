# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# マッチしないはずなのにマッチする（２）
if ("兄弟" =~ /Z/) {
    print 1;
}
else {
    print 0;
}

__END__

esjis.pl で処理したスクリプトの実行結果が以下になることを期待している

0

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
