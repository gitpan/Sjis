# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Substitution replacement not terminated
# 「置換操作の置換文字列が終了しない」
eval { s/表/裏/; };
if ($@) {
    print 0;
}
else {
    print 1;
}

__END__

esjis.pl で処理したスクリプトの実行結果が以下になることを期待している

1

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
