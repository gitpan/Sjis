# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    my $wk = 'ソース';
    if ($fileName =~ /\Q$wk\E/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

たとえば、./hoge配下に『テストソース.txt』というファイルがあったとします。
変数展開しないようにシングルクォート『my $wk = 'ソース';』にしてみます。

◆その４：コードはshiftjis、処理はshiftjis、標準入出力はshiftjis

実行結果
C:\test>perl kanji02.pl
Match
./hoge/テストソース.txt
今度は、上手く行きました。

8/2(土) ■[Perlノート] シフトJIS漢字のファイル名にマッチしてみる
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
