# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    if ($fileName =~ /ソース/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

たとえば、./hoge配下に『テストソース.txt』というファイルがあったとします。

◆その１：コードはshiftjis、処理はshiftjis、標準入出力はshiftjis

実行結果
C:\test>perl kanji00.pl
Unmatched [ in regex; marked by <-- HERE in m/メ[ <-- HERE ス/ at kanji00.pl line 6.

しかし、上記ではマッチしません。
というか、正規表現エラーになります。
これは、『ソース』の『ー』の第２バイトが『[』のコードになっているからです。
そして、閉じの『]』がないために正規表現エラーになるのです。

8/2(土) ■[Perlノート] シフトJIS漢字のファイル名にマッチしてみる
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
