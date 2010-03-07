# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# Search pattern not terminated
# 「サーチパターンが終了しない」
eval { /表/ };
if ($@) {
    print 0;
}
else {
    print 1;
}

__END__

Sjis.pm で処理したスクリプトの実行結果が以下になることを期待している

1

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
