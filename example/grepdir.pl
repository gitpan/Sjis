# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

local $^W = 1;

unless (@ARGV) {
    die <<'END';
実行方法:

jperl55.bat grepdir.pl aaa dt
jperl55.bat grepdir.pl 表  dt
jperl.exe   grepdir.pl aaa dt
jperl.exe   grepdir.pl 表  dt
END
}

&grepdir(@ARGV);

exit 0;

sub grepdir ($$) {
    my($pat,$dir) = @_;
    my($node);

# 修正箇所1
#   opendir(D,$dir);
#   my @nodes = grep (!/^\./, readdir(D));
#   closedir(D);
    my @nodes = split(/\n/,`dir /b $dir 2>NUL`);

    # --------------------------------------------------
    foreach $node (@nodes) {

# 修正箇所2
#       my $path="$dir/$node";
        my $path="$dir\\$node";

        print "!!$path!!\n";

        if ( -f $path ) {
            grepfile($pat,$path);
        }
        elsif( -d $path) {
            &grepdir($pat,$path);
        }
        else {
            print STDERR "skip:$path\n";
        }
    }
}

sub grepfile ($$) {
    my($pat,$file) = @_;
    open(IN,$file) or die "Error:open($file):$!\n";
    while (<IN>) {
        chomp;

# 修正箇所3
#       print "$file:$_\n" if (/$pat/);
        print "$file:$_\n" if (/\Q$pat\E/);
    }
}

__END__

WindowsでPerl 5.8/5.10を使うモンじゃない
http://www.aritia.org/hizumi/perl/perlwin.html

の「ここで紹介したスクリプトのサンプル」の grepdir.pl を利用しています。

例: 正規表現を指定して，指定したディレクトリ配下のファイルから取り出すコードを書いてる。

コマンド形式: jperl grepdir.pl {パターン} {ディレクトリ}

次のようなテスト環境を用意する。

C:\TEMP\TP> tree /F dt
フォルダ パスの一覧: ボリューム vvvvv_vvvvvvvvv
ボリューム シリアル番号は vvvv-ssss です
C:\TEMP\TP\DT
├─alphabet
│      alpha.txt
│      sjis.txt
│
└─日本語
       alpha.txt
       sjis.txt

これを jperl55.bat にて実行させると，次のようになる。

C:\TEMP\TP\DT>jperl55.bat grepdir.pl aaa dt
!!dt/alphabet!!
!!dt/alphabet/alpha.txt!!
dt/alphabet/alpha.txt:aaa
!!dt/alphabet/sjis.txt!!
dt/alphabet/sjis.txt:aaa
!!dt/日本語!!
!!dt/日本語/alpha.txt!!
dt/日本語/alpha.txt:aaa
!!dt/日本語/sjis.txt!!
dt/日本語/sjis.txt:aaa

C:\TEMP\TP\DT>jperl55.bat grepdir.pl 表 dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:表
!!dt\日本語!!
!!dt\日本語\alpha.txt!!
!!dt\日本語\sjis.txt!!
dt\日本語\sjis.txt:表

参考までに jperl.exe にて実行させると，次のようになる。

C:\TEMP\TP\DT>jperl.exe grepdir.pl aaa dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
dt\alphabet\alpha.txt:aaa
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:aaa
!!dt\日本語!!
!!dt\日本語\alpha.txt!!
dt\日本語\alpha.txt:aaa
!!dt\日本語\sjis.txt!!
dt\日本語\sjis.txt:aaa

C:\TEMP\TP\DT>jperl.exe grepdir.pl 表 dt
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:表
!!dt\日本語!!
!!dt\日本語\alpha.txt!!
!!dt\日本語\sjis.txt!!
dt\日本語\sjis.txt:表

直さなければならないところは，以下のようなところになる。

修正箇所1
  MS-DOS, Microsoft Windows の日本語版上で opendir, readdir, closedir を
  使用するのはもともと問題があるので以下のように dir コマンドを使うとよい。

    ----------------------------------------------
    opendir(D,$dir);
    my @nodes = grep (!/^\./, readdir(D));
    closedir(D);
    ----------------------------------------------
                ↓ 書き換え
    ----------------------------------------------
    my @nodes = split(/\n/,`dir /b $dir 2>NUL`);
    ----------------------------------------------

修正箇所2
  Windows でのディレクトリの区切りは \ なので \ を使う方が無難。

    ----------------------------------------------
    my $path="$dir/$node";
    ----------------------------------------------
                ↓ 書き換え
    ----------------------------------------------
    my $path="$dir\\$node";
    ----------------------------------------------

修正箇所3
  正規表現内に変数を記述し、変数に格納されている内容そのものにマッチ
  させたいのであれば \Q ... \E で囲む必要がある。
  (もっとも修正箇所2で / を \ に変更してしまったためだが。)

    ----------------------------------------------
    print "$file:$_\n" if (/$pat/);
    ----------------------------------------------
                ↓ 書き換え
    ----------------------------------------------
    print "$file:$_\n" if (/\Q$pat\E/);
    ----------------------------------------------

以上
