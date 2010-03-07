# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use strict;
# use warnings;

use Sjis;

while (my $fileName = glob("./hoge/*")) {
    if ($fileName =~ /\Qソース\E/) {
        print "Match\n";
    }
    else {
        print "Unmatch\n";
    }
    print $fileName, "\n";
}

__END__

たとえば、./hoge配下に『テストソース.txt』というファイルがあったとします。
『[』を普通の文字扱いするために、『ソース』を\Qと\Eで囲んでみます。

◆その２：コードはshiftjis、処理はshiftjis、標準入出力はshiftjis

実行結果
C:\test>perl kanji01.pl
Unmatch
./hoge/テストソース.txt

しかし、上記ではマッチしません。
なぜかというと、 /\Qソース\E/は、\Qより先に『ソース』文字列が評価されるので、
基本的に『[』をエスケープしたに過ぎません。

8/2(土) ■[Perlノート] シフトJIS漢字のファイル名にマッチしてみる
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
