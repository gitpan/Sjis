1;
__END__

=pod

=encoding Shift_JIS

=head1 ソフトウェア名称

Sjis-JA - "Yet Another JPerl" Source code filter to escape ShiftJIS (Japanese document)

=head1 概要

  ● 使い方: A

    スクリプト ShiftJIS_script.pl の中に以下を記述して...
      use Sjis;
      use Sjis version;          --- Sjis.pm のバージョンチェックを行う場合
      use Sjis qw(ord reverse);  --- ord, reverse の拡張機能を使う場合
      use Sjis version qw(ord reverse);

      ※ no Sjis; は利用できません。

      使える関数
        Sjis::ord(...);
        Sjis::reverse(...);
        Sjis::length(...);
        Sjis::substr(...);
        Sjis::index(...);
        Sjis::rindex(...);

    コマンドプロンプトで以下のように実行する
      perl     ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl58   ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl510  ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl512  ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...

      ? * を使ってワイルドカードの指定ができます
      ' 〜 ' を使ってクォートすることができます

  ● 使い方: B

    コマンドプロンプトで以下のように実行する

      C:\>perl  Sjis.pm  ShiftJIS_script.pl  >  Escaped_script.pl.e
      C:\>perl  Escaped_script.pl.e

      ShiftJIS_script.pl  --- ShiftJIS で書かれたスクリプト
      Escaped_script.pl.e --- エスケープされたスクリプト

=head1 要約

これまでの歴史からはじめましょう。ShiftJIS のサポートは jperl 4.019+1.3 から始
まりました。これによって chop() などの関数や正規表現を複雑な日本の文字に対して
適用できるようになりました。

Perl5.8 以降は Encode モジュールによってマルチリンガル処理がサポートされたため、
jperl は不要になったと言われています。ですが、それは本当なのでしょうか？

日本国内において、汎用大型コンピュータの入出力、パーソナルコンピュータの内部コー
ドおよび入出力、さらには携帯電話に至るまで、ShiftJIS を基本とした文字コード
が広く使われています。このソフトウェアはその ShiftJIS を直接扱います。そのため
UTF8 フラグはありません。

あなたもエンコードの問題からエスケープしませんか？

=head1 もうひとつの未来

JPerl はとても優れたソフトウェアです。おっと、ここでいう JPerl は日本語対応版の
Perl のことで、Java や JVM とは関係がありません。そんなわけで、このソフトウェア
は衝突回避のために Sjis という名前にしました。

ところで、その JPerl はバージョン 5.005_4 以降、メンテナンスされていません。

大変残念なことに、JPerlの開発を行った渡辺 博文さんは The Perl Confernce Japan
1998 にて

  "わたなべは疲れたから次の人よろしくね"

というメッセージを残し、Perl から離れていってしまいました。

スライド15 "jperl の今後"

ftp://ftp.oreilly.co.jp/pcjp98/watanabe/jperlconf.ppt

きっと誰かが引き継いで書いてくれるだろう。
などと期待をしながら10年間、待ち続ける間に世界は違う方向へと進んでいくのでした。

このソフトウェアは ShiftJIS で書かれた Perl スクリプトをエスケープ処理するための
ソースコードフィルタです。エスケープ処理によって文字コードが変化することはあり
ません。

このソフトウェアは以下の特徴があります。

=over 2

=item * ShiftJIS そのままの値を扱う

=item * 過去と現在のスクリプト間でコード、ノウハウを共有できる

=item * UTF8 フラグを扱わないですむ(perlunitut と perluniadvice の対応は不要)

=item * でも Perl5 とは互換性がある (はずだ)

=item * (JPerlを保守するために) C プログラミングを行わないですむ

=back

さあ、JPerl の未来によってもうひとつの未来を作りましょう。

=head1 基本的な仕組み

最近、以下のメールを再発見しました。

[Tokyo.pm] jus Benkyoukai

http://mail.pm.org/pipermail/tokyo-pm/1999-September/001854.html

("SJIS.pm" というファイル名で保存されているものとします)

  package SJIS;
  use Filter::Util::Call;
  sub multibyte_filter {
      my $status;
      if (($status = filter_read()) > 0 ) {
          s/([\x81-\x9f\xe0-\xef])([\x40-\x7e\x80-\xfc])/
              sprintf("\\x%02x\\x%02x",ord($1),ord($2))
          /eg;
      }
      $status;
  }
  sub import {
      filter_add(\&multibyte_filter);
  }
  1;

基本的には、このソフトウェアは上記のようなことを行います。
ただし、Filter::Util::Call を利用していない点、Perl の構文を解析して必要に応じて
エスケープする点が異なります。

=head1 インストール方法

   perl Makefile.pl         --- Makefile.pl が make.bat を生成します
   make.bat install
   make.bat test

   make.bat install         --- 現在使用中の perl 環境にインストールします
   perl58 make.bat install  --- perl5.008 環境にインストールします
   perl510 make.bat install --- perl5.010 環境にインストールします
   perl512 make.bat install --- perl5.012 環境にインストールします

   make.bat dist            --- CPAN 配布用パッケージを作ります
   make.bat tar.bat         --- tar.bat を作成します

=head1 ソフトウェアの一覧

   Sjis.pm          --- ShiftJIS ソースコードフィルタモジュール
   Esjis.pm         --- Sjis.pm のランタイムルーチン
   perl58.bat       --- 環境変数 PATH の設定なしに perl5.8 を探して実行する
   perl510.bat      --- 環境変数 PATH の設定なしに perl5.10 を探して実行する
   perl512.bat      --- 環境変数 PATH の設定なしに perl5.12 を探して実行する

=head1 文字クラスの定義

過去のperlとの互換性を保つために文字クラスは以下のように再定義されています。

  ---------------------------------------------------------------------------
  escape        class
  ---------------------------------------------------------------------------
  \d            [0-9]
  \s            [\x09\x0A\x0C\x0D\x20]
  \w            [0-9A-Z_a-z]
  \D            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9])
  \S            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x09\x0A\x0C\x0D\x20])
  \W            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9A-Z_a-z])
  \h            [\x09\x20]
  \v            [\x0C\x0A\x0D]
  \H            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x09\x20])
  \V            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x0C\x0A\x0D])
  ---------------------------------------------------------------------------

=head1 JPerl 互換の機能

以下の関数は JPerl と同様に機能します。
このソフトウェアによって書き換わる関数があります。

=over 2

=item * シングルクォート中の2オクテットコード文字列の扱い

=item * ダブルクォート中の2オクテットコード文字列の扱い

=item * シングルクォート中の2オクテットコード正規表現の扱い

=item * ダブルクォート中の2オクテットコード正規表現の扱い

=item * chop は Esjis::chop に書き換わります

=item * split は Esjis::split に書き換わります

=item * length はそのままです

=item * substr はそのままです

=item * index は Esjis::index に書き換わります

=item * rindex は Esjis::rindex に書き換わります

=item * pos はそのままです

=item * lc は Esjis::lc または Esjis::lc_ に書き換わります

=item * uc は Esjis::uc または Esjis::uc_ に書き換わります

=item * ord はそのままです(インポートしない場合)

=item * reverse はそのままです(インポートしない場合)

=item * tr/// または y/// は Esjis::tr に書き換わります

    /b と /B 修飾子が利用できます。

=item * chdir は Esjis::chdir に書き換わります

    MSWin32 環境の場合は perl5.005 に限り文字コード(0x5C)で終わるパスを扱うこと
    ができます。

=item * do file は Esjis::do file に書き換わります

=item * require は Esjis::require に書き換わります

=item * use Perl::Module @list; は

    BEGIN { Esjis::require 'Perl/Module.pm'; Perl::Module->import(@list); } に
    書き換わります。

=item * use Perl::Module (); は

    BEGIN { Esjis::require 'Perl/Module.pm'; } に書き換わります。

=back

=head1 JPerl と上位互換の機能

以下の機能は JPerl と上位互換です。

=over 2

=item * chr は Esjis::chr または Esjis::chr_ に書き換わります

    2オクテットコードに対応しています。

=item * -X (ファイルテスト演算子) は Esjis::X または Esjis::X_ に書き換わります

    例えば読取り可能かどうかをテストする -r は Esjis::r になります。

    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=item * glob は Esjis::glob または Esjis::glob_ に書き換わります

    @glob = Esjis::glob($string);
    @glob = Esjis::glob_;

    Esjis::glob は、OS間で可搬性のある拡張されたDOS風グロブ(ワイルドカード)
    機能を提供します。ディレクトリパスにもワイルドカードが使用でき、大文字か
    小文字の区別がなく、逆スラッシュとスラッシュが両方使用できます(ただし
    逆スラッシュは2重にしなければなりません)。

    実行方法は、

    use Sjis;
    @perlfiles = glob  "..\pe?l/*.p?";
    print <..\pe?l/*.p?>;

    "~" は現在のユーザのホームディレクトリに展開されます。
    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=item * lstat は Esjis::lstat または Esjis::lstat_ に書き換わります

    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=item * opendir は Esjis::opendir に書き換わります

    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=item * stat は Esjis::stat または Esjis::stat_ に書き換わります

    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=item * unlink は Esjis::unlink に書き換わります

    MSWin32 環境にて文字コード(0x5C)で終わるパスを扱うことができます。

=back

=head1 文字指向の関数

=item * ord は Sjis::ord または Sjis::ord_ に書き換わります

    "use Sjis qw(ord);" によって ord は Sjis::ord に書き換わるようになります。

    $ord = Sjis::ord($string);

    Sjis::ord($string) は $string の先頭の文字の ShiftJIS コード値を返します。
    $string が省略された場合は $_ が対象となります。この関数は常に符号なしの
    値を返します。

    この動作は JPerl と非互換なので明示的にインポートした場合のみ機能するように
    なっています。

=item * reverse は Sjis::reverse に書き換わります

    "use Sjis qw(reverse);" によって reverse は Sjis::reverse に書き換わるよう
    になります。

    @reverse = Sjis::reverse(@list);
    $reverse = Sjis::reverse(@list);

    Sjis::reverse(@list) はリストコンテキストでは @list の要素を逆順に並べた
    リスト値を返します。
    これを利用して、降順の数列を発生させることもできます。

    for (Sjis::reverse(1 .. 10)) { ... }

    @list としてハッシュを渡した場合、そのハッシュはフラットなリストに変換されま
    す。このことを利用すれば、reverse を使ってハッシュを逆向きにする(値からキーを
    ひけるようにする)ことができます(ただし、すべての値がユニークであることが前提
    です)。

    %barfoo = Sjis::reverse(%foobar);

    スカラーコンテキストでは @list のすべての要素を連結した上で、ShiftJIS の
    文字単位で逆順にしたものを返します。

    この動作は JPerl と非互換なので明示的にインポートした場合のみ機能するように
    なっています。

=item * Sjis::length

    $length = Sjis::length($string);
    $length = Sjis::length();

    Sjis::length($string) はスカラー値 $string の長さを ShiftJIS の文字数で返
    します。$string を省略した場合は $_ の文字数を返します。

    文字列の長さを、文字単位ではなく、バイト単位で数えるには

    $blen = length $string;

    あるいは

    $blen = CORE::length $string;

    とします。

=item * Sjis::substr

    $substr = Sjis::substr($string,$offset,$length,$replacement);
    $substr = Sjis::substr($string,$offset,$length);
    $substr = Sjis::substr($string,$offset);

    Sjis::substr は、ShiftJIS 文字列 $string で指定された文字列から部分文字列を取り
    出して返します。部分文字列は、文字列の先頭から数えて $offset 文字目から始まる、
    $length 文字分です。$offset が負ならば、文字列の末尾から -$offset 文字分戻った
    ところから部分文字列が開始します。$length を省略すると、文字列の末尾まですべてが
    返されます。$length が負ならば、文字列の末尾から -$length 文字が残るように、長さ
    が決められます。そうでなければ、$length は、あなたが期待するように、取り出す部分
    文字列の長さを表しています。

    Sjis::substr を左辺値(代入の対象となるもの)として使うことはできません。その代わ
    りに、第4引数 $replacement に置き換え用の文字列を指定します。この場合、
    Sjis::substr は $string の一部を文字列 $replacement で置き換えるとともに、
    (splice のように)置き換えられた部分を値として返します。次の例は、$var の最後の
    文字を "Curly" で置き換えるとともに、置き換えられた文字を $oldstr にセットしま
    す:

    $oldstr = Sjis::substr($var, -1, 1, "Curly");

    $var の先頭に文字列 "Larry" を付けるには、次のようにします:

    Sjis::substr($var, 0, 0, "Larry");

    $var の最初の1文字を "Moe" で置き換えるには、次のようにします:

    Sjis::substr($var, 0, 1, "Moe");

    $var の最後の1文字を "Curly" で置き換えるには次のようにします:

    Sjis::substr($var, -1, 1, "Curly");

=item * Sjis::index

    $index = Sjis::index($string,$substring,$start);
    $index = Sjis::index($string,$substring);

    Sjis::index は、ShiftJIS 文字列 $string の中に含まれる、もう1つの ShiftJIS 文
    字列 $substr を探します。$string の中で、$substr が最初に出現する位置を文字単位
    で数えて返します。$start が指定されている場合、$string の先頭から $start 個の
    文字をスキップした位置から、$substr を探し始めます。位置は 0 をベースにとして
    数えます。$substr が見つからなければ、Sjis::index 関数はベースより 1 だけ小さい
    値 -1 を返します。Sjis::index を使って、文字列全体を調べるには、次のようにし
    ます。

    $pos = -1;
    while (($pos = Sjis::index($string, $lookfor, $pos)) > -1) {
        print "Found at $pos\n";
        $pos++;
    }

=item * Sjis::rindex

    $rindex = Sjis::rindex($string,$substring,$position);
    $rindex = Sjis::rindex($string,$substring);

    Sjis::rindex は Sjis::index と似ていますが、ShiftJIS 文字列 $string の中で、
    部分文字列 $substr が最後に出現する位置を文字単位で数えて返します(つまり
    reverse Sjis::index です)。$substr が見つからなければ、-1 を返します。$position
    によって、値として返すことが許される、最も右よりの位置を指定することができます。
    Sjis::rindex を使って、文字列全体を末尾から先頭に向かって調べるには、次のよう
    にします。

    $pos = Sjis::length($string);
    while (($pos = Sjis::rindex($string, $lookfor, $pos)) >= 0) {
        print "Found at $pos\n";
        $pos--;
    }

=back

=head1 環境変数

 このソフトウェアは排他制御に flock 関数を使用します。ファイルが読取り可能になるまで
 あるいは書込み可能になるまでプログラムの実行はブロックされます。
 これを環境変数 SJIS_NONBLOCK を定義することでブロックさせないようにすることができま
 す。

 例:

   SET SJIS_NONBLOCK=1

 (値 '1' は意味を持たないので何でも構いません)

=head1 バグと制限事項

バグ報告、パッチを歓迎します。

=over 2

=item * format

    オリジナルの Perl と機能が同じです(ShiftJIS に対応していません)。

=item * chdir

    MSWin32 環境の perl5.006, perl5.008, perl5.010 にて文字コード(0x5C)で終わ
    るパスを扱うことができません。

    参考リンク
    Bug #81839
    chdir does not work with chr(0x5C) at end of path
    http://bugs.activestate.com/show_bug.cgi?id=81839

=item * m/$re/o, s/$re/foo/o, qr/$re/o の /o 修飾子

    perl5.006 にて /o 修飾子が期待通りの動作をしませんでした。変数 $re の値が
    変更されると次回の実行時にその変更が反映されます。

=item * 正規表現内のエスケープ文字 \b と \B

    正規表現内のエスケープ文字 \b と \B は期待通りの機能をしません。

=back

=head1 作者

このプロジェクトは 稲葉 準 ina@cpan.org によって始まりました。
このファイルを分かち合いましょう。

=head1 著作権

このソフトウェアはフリーソフトウェアです。あなたは Perl と同じライセンス
の元で再配布及び変更を行うことが出来ます。詳しくは perlartistic を参照して
ください。

このソフトウェアは有用であることを願って頒布されますが、*全くの無保証* 
です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含
め全く存在しません。

=head1 シフトJISコードとは(日本語情報処理より)

シフトJIS符号化は、マイクロソフト社により開発された、日本のコンピュータで最もよく
用いられる符号化方式です。シフトJISは「MS漢字(Microsoft漢字)」、または「SJIS
(ShiftJISの略称)」とも呼ばれています。

かつて日本のコンピュータユーザは半角片仮名しか使えなかったため、従来方式との互換性
を維持する目的でシフトJISが開発されました。

シフトJISにおいては、16進数で 0x81〜0x9F または 0xE0〜0xEF の範囲を持つオクテット
によって1文字2オクテットモードが開始します。そしてこのオクテットは、そこから始まる
2オクテット文字の第1オクテットとして処理されます。続く(第2)オクテットは、16進数で
0x40〜0x7E または 0x80〜0xFC の範囲を持つ値でなければなりません。第1オクテットの
範囲は拡張ASCII文字セット、つまり最上位ビットがオンになった8ビット文字セットの範囲
に完全に収まっていることに注目してください。またシフトJISは、半角片仮名とASCII/JIS
ローマ字もサポートしています。

一部のシフトJIS仕様(特にメーカ仕様)では、ユーザ定義文字のコード領域や、場合によって
は半角片仮名空白文字のコード位置も定義されています。もし本格的な情報交換を望むので
あれば、このようなコード領域やコード位置は不都合です。というのも、このような文字は、
別の日本語符号化方式(つまりJISとEUC)のコード位置に変換できないように符号化されてし
まうからです。

=head1 ウィキペディアによる「Shift_JIS」の定義

Shift_JIS (2009.09.17 14:00:00 JST). In Wikipedia: The Free Encyclopedia.
Retrieved from
http://ja.wikipedia.org/wiki/Shift_JIS

出典: フリー百科事典『ウィキペディア(Wikipedia)』

Shift_JIS(IANAへの登録名。読み方は『シフトジス』)は、現在多くのパソコン上で
日本語を表すために使われている文字コードである。独自のコードを使っていた会社
があったが、現在は標準化しているJIS X 0208の附属書1で規定している。

Microsoft等の各ベンダが実装するShift_JISの亜種については『Microsoftコードペー
ジ932』を参照。Mac OSが実装する亜種については『MacJapanese』を参照。

Shift_JISの誕生
1980年代、パソコン用16ビットCPUの普及もあいまって、漢字を表示可能なハードウェ
アを備えたパソコンが続々と発売された。そのため、これらパソコン用の文字符号化
方式を模索していた。

Shift_JISを「シフトJISコード」と呼んで符号化文字集合(文字コード)の面のみを
考える議論があるが、ここでは文字符号化方式の面に焦点を当てる。

この文字符号化方式には、先行してよく利用していたJIS C 6220(現在のJIS X 0201)
の8ビット符号(以下「英数字・半角カナ」)と、JIS C 6226(現在のJIS X 0208、
以下「漢字」)の両文字集合を、表現しようとした。ファイルの大きさ、処理時間の
短縮を図るためエスケープシーケンスなしで混在可能にすることを考案した。

JIS C 6220とJIS C 6226の2つはともに、ISO 2022で文字集合を切り替えて利用する
設計があった。ISO 2022にもとづく文字符号化方式では、英数字、半角カナ、漢字は
それぞれ、8ビット符号空間の中のGL/GRという領域の1つを(ただし漢字は2回)使う
ことで表現できる。もし英数字と漢字の2つをエスケープシーケンスなしで混在したい
なら、英数字をGL、漢字をGRに割り当てる方法がある。EUC-JPは、おおよそそのよう
に実装している。

しかし、パソコンではすでに、JIS X 0201の8ビット符号、つまり、GLに英数字、GRに
１バイトカタカナ(半角カタカナ)を割り当てることが普及していた。英数字と１バイ
トカタカナの2つを動かすことは、文字化けの原因になるため避ける必要があった。
そのため、ISO 2022の枠内の領域に漢字を混在させることは困難だったのである。

1982年、漢字の符号位置を複雑に移動(シフト)し、符号空間の隙間に押し込む
ShiftJISが誕生した。これを実現するためには、漢字の1バイト目として、ISO 2022
におけるGR(A1(16)-FE(16))領域に3分の1残していた未使用領域にくわえ、ISO 2022
において非使用のCR(80(16)-9F(16))領域を使用することとした。ただし、GL
(21(16)-7E(16))領域においては、JIS X 0201の記号に当たる部分は極力避けた。
さらに2バイト目にはISO 2022とは異なり、英数字・半角カナに使用済みの領域をも
含む、GL、CR、GRにあたる各領域のほぼ全てを使う必要があった。

マイクロソフト(日本法人)元会長の古川享によると、Shift_JISの制定には、アス
キー、マイクロソフト(米)、三菱電機、マイクロソフトウェア・アソシエイツ、
デジタルリサーチ(米)が関わり、特にアスキーの山下良蔵が中心となって作成した
ものだという。これに対する異説として、京都大学助教授の安岡孝一は、マイクロソフ
トウェア・アソシエイツと三菱電機のみの共同開発だと主張している。山下本人の発言
により安岡は自説の撤回とも取れる発言をしている。

Shift_JISの標準化
Shift_JISは、符号化文字集合とその文字符号化方式の両方を含む現実の問題を解決
するための技術である。それゆえ、JIS X 0208の文字集合を利用してはいるものの、
ISO 2022の符号化の方針の範囲の外にある。

しかしながら、現在では、JIS X 0208:1997の附属書1にて「シフト符号化表現」という
名前で、仕様が定義されている。これは、デファクトスタンダードとなっている技術
については出自を問題とせず、ともかく標準化してしまおうという意図が日本工業標準
調査会 (JISC) にあってのことである。

JIS X 0208の拡張規格であるJIS X 0213では、2000年制定の初版で附属書1として
Shift_JISX0213が定められた。2004年改正時の10文字追加に伴って、Shift_JIS-2004
と名称が変更された。

IANAも「Shift_JIS」という名前で登録している。

利点と欠点

利点
1. 全角文字と、JIS X 0201で定義したいわゆる半角カナ文字を同一のコード体系で
   表現できる。
2. 日本語環境においては、MS-DOSで日本語用文字コードとして採用されて以来、パソ
   コンにおいて圧倒的な普及度があり、その他の文字符号化方式に比べてデータ交換
   可能性が高い (ただし、文字集合については実装ベンダがJIS X 0208で規定されて
   いない機種依存の拡張を施していることが多く、こういった拡張部分に関しては
   データ交換可能性が低い)。

欠点
1. 半角カナのための領域を確保した関係上、コードシークエンスが区点番号の「区」
   の区切りではない箇所で分断している。このため、コード番号を演算で求める際は
   煩雑な処理が必要である。
2. 2バイト目に80(16)未満(ASCIIのコード領域)が現れる。このため、文字の区切りの
   判定に手間がかかる。ファイル、電文の先頭から文字コード判定する場合はよいが、
   後ろから文字コードの判定をしようと思うと、最悪の場合、先頭までたどらないと
   いけないことがあるため、プログラムの作り方に工夫が必要になる。また、この領
   域に含まれる一部の文字の扱いのため、マルチバイトのEUC-JP、UTF-8などより、プ
   ログラミング上の扱いが難しい。→次項
3. JIS補助漢字が表現できない。補助漢字の文字数はShift_JISのコード未登録部分に
   収まらない。

2バイト目が5C等になりうることによる問題

Shift_JISでは、「ソ」「噂」など一部の字の2バイト目に、5C(16)(Shift_JISでは
￥記号、ASCIIなどではバックスラッシュ)を使用している。多くのプログラミング
言語 (C、Perl、Bourne Shellなど多数) では、この5C(16)をエスケープ文字として
いる。したがって、ソースコードや文字データの処理においてShift_JISを想定して
いないプログラミング環境では問題が起こる。この問題は、同じように2バイト目の
範囲に5C(16)を含むBig5や、まれではあるがGBKなどの文字コードでも発生しうる。

また、5C(16)以外についても類似の問題が発生することがある。たとえば、Unixや
MS-DOSなどのシェル上で7C(16) (Shift_JISやASCIIではバーティカルバー) を含む
文字(−、ポ、л、榎、掛、弓、芸、……)をファイル名に使用しようとすると、
パイプ記号と認識され、正常にファイルが作成されなかったり、読み込みが不良に
なったりすることがある。

現在でも、シングルバイト文字コード対応のソフトウェアをShift_JIS環境で使用する
と、改行などの動作やファイル名の処理などにしばしばこの問題がつきまとう。この
不具合を招く、2バイト目に5C(16)を持つ文字のことを、だめ文字と呼び、この中には
「ソ」「構」「能」「表」など一般に使用頻度の高い文字もある[1]。

この問題を回避する伝統的な方法として、ソースコード全体をEUCコードやUTF-8など
に変換してからコンパイルしたり実行したりする方法がある。あるいは「ソ\」の
ように2バイト目の直前にエスケープ文字の5C(16)を記述し、だめ文字を文字として
正しく認識させるなどの方法もある(Perl のSjisソフトウェアなど)。最近では、多く
のプログラミング言語がShift_JISに対応するようになったため、Shift_JISを含む
ソースコードやデータを扱ってもこの問題は起きなくなったが、旧来のソフトウェア
資産を利用する上では依然、問題がつきまとう。

例

頻繁に見る例として、「構わない」という文字列がいくつかの掲示板ソフトで
「高�｢ｯﾈい」と化ける。

   構   わ   な   い
  8d5c 82ed 82c8 82a2
  バックスラッシュにあたる5cが抜けると、
  8d   82ed 82c8 82a2
    高    �｢ｯ  ﾈ   い

「い」という文字のところでデコードが再同期され後の文字列は正常に戻る。また同様
に「芸能界」が「芸矧E」に化ける例もある。 

   芸    能   界
  8c7c 945c 8a45
  バックスラッシュにあたる5cが抜けると、
  8c7c 94   8a45
   芸    矧   E

  表 2バイト目に5C(16)を持つ文字一覧 文字 符号(16進) 読み・意味 

  ―   815C ダッシュ
  ソ   835C 片仮名の「そ」
  Ы   845C キリル文字のウィ
  �\/? 875C Windows環境ではローマ数字の9
            Mac環境ではGB(ギガバイト)
  噂   895C うわさ。
  浬   8A5C 海里
  欺   8B5C あざむく。詐欺
  圭   8C5C けい。人名。
  構   8D5C かまえる。構造
  蚕   8E5C カイコ。養蚕
  十   8F5C 漢数字の10。
  申   905C もうす、しん。申請
  曾   915C そ、ひ。「曽」の印刷標準字体。曾孫
  箪   925C たん。箪笥
  貼   935C はる。貼付
  能   945C のう。能力
  表   955C あらわす、ひょう。表現
  暴   965C あばれる、ぼう。暴力
  予   975C あらかじめ、よ。予備
  禄   985C ろく。俸禄
  兔   995C と、うさぎ。「兎」の異体字
  喀   9A5C かく。喀血
  媾   9B5C こう。媾和(講和の非書換え)
  彌   9C5C や。弥生の「弥」の旧字体
  拿   9D5C だ。拿捕
  杤   9E5C 栃の別体
  歃   9F5C すする、そう、しょう。
  濬   E05C さらう、しゅん。
  畚   E15C ふご、ほん。
  秉   E25C とる、へい。
  綵   E35C あや、さい。
  臀   E45C でん、しり。臀部
  藹   E55C あい。和気藹々
  觸   E65C 触の旧字体
  軆   E75C 体の古字
  鐔   E85C つば。刀の鐔(鍔)。
  饅   E95C まん。饅頭
  鷭   EA5C バン。鳥の名。
  �x   ED5C しゅん。
  �x   EE5C ぎょく。
  �\   FA5C わた、こう。
  �\   FB5C ぎん。

コード空間における文字数制限
Shift_JISの2バイトコードの空間は、第1バイトが81(16)-9F(16)ならびにE0(16)-FC(16)、
第2バイトが40(16)-7E(16)ならびに80(16)-FC(16)である。したがって、60×188=11280
文字、さらに1バイトコードが158文字 (スペースを含み、DELは数えず)であるため、
計11438文字となる。

なお、Shift_JIS-2004では、2バイト文字が11233文字、1バイト文字が158文字のため、
合計11391文字を使用している。

Shift_JISにおける「シフト」とは
ISO-2022-JPは指示シーケンスで漢字とアルファベットを切り替える符号化方式である。
また、EUC-JPは補助漢字と半角カタカナをシングルシフトで一時的に切り替えて使う
符号化方式である。これらの符号化方式では、各文字集合の面をシフトコードによって
切り替え(シフトし)ている。

しかしながら、Shift_JISの『シフト』とはこの意味でのシフトではない。また、ビット
シフトの『シフト』でもない。この『シフト』とは、256×256の平面の中で文字を
複雑に"ずらす"という意味の『シフト』である。

Shift_JISと区点番号
Shift_JISが符号化の対象にする文字セットは、JIS X 0208である。この符号化文字
集合には、区点番号という概念が存在する。これは、94×94の文字表の行と列の番号
の組である。

Shift_JISでは、8140(16)-FCFC(16)というように、JIS X 0208とはまったく違った
コード体系であるが、JIS X 0208を計算により変形したものであるため、区点番号を
用いて文字のコードポイントを指し示すことが多い。内容については、JIS X 0208の
1〜94区と同じである。ただし、機種依存文字では、シフトJISの符号空間から逆成し、
94区の下方にあたかも120区までが拡張しているかのように扱うことがある。95区以上
は、ISO/IEC 2022に則ったJIS X 0208の構造では存在し得ないので、本来はおかしい。
ベンダ独自の非公式な概念である。なお、JIS X 0213の規格の一部である
Shift_JISX0213符号化表現においては、第1バイトF0(16)以降を2面の文字に割り当て
ており、百何区というような存在しない区番号は登場しない。

「x-sjis」と「MS_Kanji」
「x-sjis」と「MS_Kanji」はともに、HTMLドキュメントの「charset」の指定に
「Shift_JIS」の別名として使うことが出来る。

「x-sjis」はIANAに「Shift_JIS」という名前を登録する前に、Netscape Navigator 2.0
において使っていたエンコーディングの指定子名である。一部のHTML生成ソフトが自動
でこの指定子を組み込んで使っている。そのため認識可能なブラウザがあるが、
「Shift_JIS」に書き換えることを推奨している。


=head1 このソフトウェアでの "ShiftJIS"

このソフトウェアでいう "ShiftJIS" は上記の「コード空間における文字数制限」の
11438文字すべてを扱えることを目指しています。そのためにアルゴリズムは2つ使わ
れています。

  * アルゴリズム 1

    オクテットの並びから文字を取り出すとき、1オクテットコードと2オクテットコード
    の区別は第1オクテットコードのみで行われます。第2オクテットは考慮されません。

    1オクテットコード:
      0x00-0x80, 0xA0-0xDF, 0xFD-0xFF

    2オクテットコード:
      第1オクテット  0x81-0x9F, 0xE0-0xEF, 0xF0-0xFC
      第2オクテット  0x00-0xFF (すべて)

    不正な1オクテットコード:
      0x81-0x9F, 0xE0-0xFC
      * 文字列の最終オクテットが2オクテットコードの第1オクテットと同じ場合

以下にコード表を掲載します。

        1オクテットコード表

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

                                 2オクテットコード表
            第1オクテット                                    第2オクテット


   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


    *不正な* 1オクテットコード

文字列の最終オクテットが2オクテットコードの第1オクテットと同じ場合

不正であっても無視されたり、自動的に削除されることはありません。
例えば、Esjis::chop はこのオクテットを返します。

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| 0x81-0x9F
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|M|M|M|M|M|M|M|M|M|M|M|M|M| | | |  0xE0-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=head1 ベンダ別 SJIS コード一覧

http://home.m05.itscom.net/numa/cde/sjis-euc/sjis.html

 DEC PC                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 DEC WS                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu TrueType font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu FontCity font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi PC                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi WS                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 IBM                            0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC Windows (PC)               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC DOS (PC)                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 SONY NEWS-OS                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Sun Wabi                       0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Unisys PC                      0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 HP Japan Japanese HP-15        0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 AT&T Japan                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Mitsubishi Electric FONTRUNNER 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Concurrent Japan               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Informix ASCII INFORMIX V6 ALS 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC), (0xFD)(0xA1-0xFE)(0xA1-0xFE)
 Oracle Oracle7 (Release 7.1.3) 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x00-0xFF)
 Sybase SQL Server, Open Server 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 
 日本語情報処理(ISBN 4-89052-708-7)より
 
 Hewlett-Packard HP-15          0x00-0x7F, 0xA1-0xDF, (0x80-0xA0, 0xE0-0xFE)(0x21-0x7E, 0x80-0xFF)


  * アルゴリズム 2

    アルゴリズム 1 にも関わらず、tr/// により文字の範囲を指定された場合は以下の文字
    のみが有効となります。

    1オクテットコード:
      0x00-0x80, 0xA0-0xDF, 0xFD-0xFF

    2オクテットコード:
      第1オクテット  0x81-0x9F, 0xE0-0xEF, 0xF0-0xFC
      第2オクテット  0x40-0x7E, 0x80-0xFC

例えば、[\x81\x00-\x82\xFF] と書かれた場合は [\x81\x82][\x40-\x7E\x80-\xFC] を
意味します。

以下にコード表を掲載します。

        1オクテットコード表

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                 2オクテットコード表
            第1オクテット                                    第2オクテット

   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x40-0x7E
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x80-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=head1 目標としているもの

プログラミング Perl 第3版 VOLUME 1 (ISBN 4-87311-096-3)
15章 Unicode 参照

Unicode サポートが perl に導入される以前は、eq 演算子は、2つのスカラー変数によっ
て表されたバイト列をただ比べていました。perl5.8 以降、eq は、2つのバイト列を比べる
と同時に UTF8 フラグを考慮します。

結果的にこの変更は、過去のスクリプトと新しいスクリプトの間に大きな溝を作りました。
もはや両者のスクリプトはコードを互いに再利用することができません。また新しい方法は
プログラマに負担をかけるため、現存するスクリプトがすべて置き換わるのはまだまだ時間
がかかると思われます。

新しい方法で問題となっていることは UTF8 フラグは実際の文字列の符号化と一致しないこと
です。自分で作ったスクリプトはそのデバッグの前に UTF8 フラグについてデバッグしなけ
ればなりません。

そこで昔の方法に戻すことによって、どのように解決されるのか Programming Perl, 3rd ed.
(邦訳 プログラミングPerl 第3版) の402ページをもう一度引用しましょう。

理想的には、以下の5つのゴールを実現しようと考えています。

=over 2

=item * ゴール1

    既存のバイト指向のスクリプトは、以前扱っていた既存のバイト指向のデータに対し
    て、以前と同様に動作すべきである。

    これは ShiftJIS がバイト指向である ASCII および JIS X 0201 と組合わせて利用
    できるよう設計されたことによって、すでに達成されています。

=item * ゴール2

    既存のバイト指向のスクリプトは、何も手を加えずに、(そうすることが適切であれば)
    新しい文字指向のデータに対しても動作するようになるべきである。

    組込み関数 length, substr, index, rindex, pos などの文字列の長さや位置を扱う
    ものは今までどおりに1オクテットを 1 と数えます。この部分について何も手は加
    わりません。2オクテットコード1文字の length は 2 になります。

    一方、スクリプト中の正規表現は、マルチバイト文字のためのアンカーリング処理を
    記述する必要がありますが、それをあなたに代わってこのソフトウェアが行います。

    ゴール1とゴール2の内容を図示します。

                                   GOAL#1  GOAL#2
                            (a)     (b)     (c)     (d)     (e)
         ┌───────┬───┬───┬───┬───┬───┐
         │ データ       │ Old  │ Old  │ New  │ Old  │ New  │
         ├───────┼───┼───┴───┼───┴───┤
         │ スクリプト   │ Old  │     Old      │     New      │
         ├───────┼───┼───────┴───────┤
         │ インタプリタ │ Old  │             New              │
         └───────┴───┴───────────────┘
          Old --- 既存のバイト指向
          New --- 新しい文字指向

    データ、スクリプト、インタプリタの新・旧に関して、上の (a) から (e) までの
    組合せがあります。この文書が書かれた当時に存在しなかった Encode モジュールと
    このソフトウェア、および存在していた JPerl を書き足してみましょう。

                            (a)     (b)     (c)     (d)     (e)
                                           JPerl          Encode,Sjis
         ┌───────┬───┬───┬───┬───┬───┐
         │ データ       │ Old  │ Old  │ New  │ Old  │ New  │
         ├───────┼───┼───┴───┼───┴───┤
         │ スクリプト   │ Old  │     Old      │     New      │
         ├───────┼───┼───────┴───────┤
         │ インタプリタ │ Old  │             New              │
         └───────┴───┴───────────────┘
          Old --- 既存のバイト指向
          New --- 新しい文字指向

    JPerl がとても優れている理由は (c) の位置にあるからです。すなわち日本語処理
    を行うためにスクリプトに特別な記述を行う必要がありません。

    対照的なのは Encode モジュールやこのソフトウェアにて "use Sjis;" を記述する
    場合です。この場合は新たなスクリプトの書き方をする必要があります。

=item * ゴール3

    スクリプトは、新しい文字指向モードでも、以前のバイト指向モードと同じスピー
    ドで動作すべきである。

    それは無理。だって、以下の時間が必要だもの。

    (1) スクリプトをエスケープして、バイト指向 Perl で扱えるように処理するための
     時間。ただし、処理されたスクリプトは保存できるため、次回からはこの時間をなく
     すことも可能です。

    (2) エスケープされたスクリプトがマルチバイトアンカーリング処理を行いながら、
     正規表現を実行する時間。

    すでに存在する ASCII データは1文字が1オクテットにパックされています。その
    データと互換性を保ちながら文字種を増やそうとすると、ISO-2022 のようにエスケー
    プシーケンスが必要であったり、ShiftJIS や UTF-8 のように "エスケープビット"
    が必要になったりします。これらのエスケープ処理が加わるため、以前と同じスピー
    ドで動作すべきであるというのは無理な目標だと思います。

=item * ゴール4

    Perl は、バイト指向の Perl と文字指向の Perl に枝分かれせずに、1つの言語で
    あり続けるべきである。

    バイト指向の Perl はすでにバイナリデータを扱うことができるため、文字指向の
    Perl を別立てで作成する必要はありません。このソフトウェアは単なる Perl のアプ
    リケーションプログラムであり、フィルタプログラムとして作成されています。
    基本的には perl が実行できる環境ならば動作するでしょう。

=item * ゴール5

    JPerl ユーザが Perl で JPerl を保守できるようになる。

    たぶん。

=back

Programming Perl, 3rd ed. が書かれた頃には、UTF8 フラグは生まれておらず、Perl は
簡単な仕事を簡単にできるように設計されていました。このソフトウェアは当時のような
プログラミング環境を提供します。

=head1 参考文献

 プログラミングPerl 改訂版
 By Larry Wall, Tom Christiansen, Randal L. Schwartz, 近藤 嘉雪 訳
 1997年12月 発行
 759ページ
 ISBN 4-900900-48-6
 http://www.oreilly.co.jp/out/pperl/index.htm

 プログラミングPerl 第3版 VOLUME 1
 By Larry Wall, Tom Christiansen, Jon Orwant, 近藤 嘉雪 訳
 2002年09月 発行
 756ページ
 ISBN 4-87311-096-3
 http://www.oreilly.co.jp/books/4873110963/

 プログラミングPerl 第3版 VOLUME 2
 By Larry Wall, Tom Christiansen, Jon Orwant, 近藤 嘉雪 訳
 2002年09月 発行
 680ページ
 ISBN 4-87311-097-1
 http://www.oreilly.co.jp/books/4873110971/

 Perlクックブック 第2版 VOLUME 1
 By Tom Christiansen, Nathan Torkington, Shibuya Perl Mongers 監訳, 株式会社ドキュメントシステム 訳
 2004年09月 発行
 752ページ
 ISBN 4-87311-202-8
 http://www.oreilly.co.jp/books/4873112028/

 Perlクックブック 第2版 VOLUME 2
 By Tom Christiansen, Nathan Torkington, Shibuya Perl Mongers 監訳, 株式会社ドキュメントシステム 訳
 2004年09月 発行
 464ページ
 ISBN 4-87311-203-6
 http://www.oreilly.co.jp/books/4873112036/

 Perlクイックリファレンス
 By Stephen Spainhour, Ellen Siever, Nathan Patwardhan, 近藤 嘉雪, 台場 圭一 監訳
 2000年03月 発行
 784ページ
 ISBN 4-900900-72-9
 http://www.oreilly.co.jp/books/4900900729/

 初めてのPerl Win32システム
 Randal L. Schwartz, Erik Olson, Tom Christiansen 著, 有馬 三郎 監訳, 石原 智浩 訳
 1998年11月 発行
 348ページ
 ISBN 4-900900-79-6
 http://www.oreilly.co.jp/books/4900900796/

 初めてのPerl 第5版
 Randal L. Schwartz, Tom Phoenix, brian d foy 著
 2009年10月24日 発売
 424ページ
 ISBN978-4-87311-427-9
 http://www.oreilly.co.jp/books/9784873114279/

 Perlリソースキット - UNIX版
 Futato, Irving, Jepson, Patwardhan, Siever 共著, イエローレーベル 山本 浩 訳
 ISBN4-900900-65-6

 日本語情報処理
 Understanding Japanese Information Processing
 By Ken Lunde, 春遍雀來, 鈴木武生 訳
 1995年8月 発行
 496ページ
 ISBN 4-89052-708-7

 CJKV日中韓越情報処理
 Chinese, Japanese, Korean & Vietnamese Computing
 By Ken Lunde, 小松 章, 逆井 克己 訳
 2002年12月 発行
 1172ページ
 ISBN 4-87311-108-0
 http://www.oreilly.co.jp/books/4873111080/

 詳説 正規表現 第2版
 By Jeffrey E. F. Friedl, 田和 勝 訳
 2003年05月 発行
 464ページ
 ISBN 4-87311-130-7
 http://www.oreilly.co.jp/books/4873111307/

 詳説 正規表現 第3版
 By Jeffrey E. F. Friedl, 株式会社ロングテール／長尾 高弘 訳
 2008年04月 発行
 528ページ
 ISBN 978-4-87311-359-3
 http://www.oreilly.co.jp/books/9784873113593/

 Perlプログラミング
 Larry Wall, Randal L.Schwartz, 近藤 嘉雪 訳
 1993年2月発行
 ISBN 4-89052-384-7
 http://www.context.co.jp/~cond/books/old-books.html

 JIS漢字字典
 芝野耕司 編著
 1456 頁
 ISBN 4-542-20129-5
 http://www.webstore.jsa.or.jp/lib/lib.asp?fn=/manual/mnl01_12.htm

 UNIX MAGAZINE
 1993年8月号
 172ページ
 T1008901080816 雑誌08901-8
 http://ascii.asciimw.jp/books/magazines/unix.shtml

=head1 謝辞

このソフトウェアは、以下の方々の作成したソフトウェアおよび文書のおかげにより作成
されました。全ての方に感謝いたします。

 山下 良蔵さん, シフトJISのデザインの話
 ttp://furukawablog.spaces.live.com/Blog/cns!1pmWgsL289nm7Shn7cS0jHzA!2225.entry
 (先頭に 'h' を付加してアクセスしてください)

 Larry Wall, Perl
 http://www.perl.org/

 歌代 和正さん, jcode.pl
 ftp://ftp.iij.ad.jp/pub/IIJ/dist/utashiro/perl/

 Jeffrey E. F. Friedl, Mastering Regular Expressions
 http://www.oreilly.com/catalog/regex/index.html

 貞廣 知行さん, Shift-JISテキストを正しく扱う
 http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm

 まつもと ゆきひろさん, Ruby on Perl(s)
 http://www.rubyist.net/~matz/slides/yapc2006/

 藤岡 和夫さん, jperlユーザーのために
 http://homepage1.nifty.com/kazuf/jperl.html

 和泉 宏明さん, WindowsでPerl 5.8/5.10を使うモンじゃない
 http://www.aritia.org/hizumi/perl/perlwin.html

 塚本 牧生さん, Perlメモ/Windowsでのファイルパス
 http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

 chaichanPaPaさん, シフトJIS漢字のファイル名にマッチしてみる
 http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826

 鈴木 紀夫さん, Jperl
 http://homepage2.nifty.com/kipp/perl/jperl/

 渡辺 博文さん, Jperl
 http://search.cpan.org/~watanabe/
 http://mail.pm.org/pipermail/tokyo-pm/1999-September/001854.html

 小飼 弾さん, Encode モジュール
 http://search.cpan.org/dist/Encode/

 Juerd, Perl Unicode Advice
 http://juerd.nl/site.plp/perluniadvice

 daily dayflower, 2008-06-25 perluniadvice
 http://d.hatena.ne.jp/dayflower/20080625/1214374293

 Tokyo-pm 保存書庫
 http://mail.pm.org/pipermail/tokyo-pm/

=cut

