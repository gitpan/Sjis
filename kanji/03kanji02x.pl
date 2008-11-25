#!/usr/bin/perl
use strict;
# use warnings;

while (my $fileName = glob("./hoge/*")) {
    my $wk = "ソース";
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
一度『ソース』文字列を変数に格納してみます。

◆その３：コードはshiftjis、処理はshiftjis、標準入出力はshiftjis

実行結果
C:\test>perl kanji02x.pl
Unmatch
./hoge/テストソース.txt

しかし、上記ではマッチしません。
これは、『my $wk = "ソース";』で『ソ』の第２バイトがエスケープ文字『\』の
コードになっているからです。
そして、『ソ』の第１バイトと『ー』の第１バイトがくっ付いてしまうのです。

8/2(土) ■[Perlノート] シフトJIS漢字のファイル名にマッチしてみる
http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826
