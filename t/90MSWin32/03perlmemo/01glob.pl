# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

my @file = glob('./*');
if (grep(/F機能/, @file)) {
    if (grep(/D機能/, @file)) {
        print "ok - 01glob.pl $^X $__FILE__\n";
    }
    else {
        print "not ok - 01glob.pl $^X $__FILE__\n";
    }
}
else {
    print "not ok - 01glob.pl $^X $__FILE__\n";
}

__END__

Perlメモ/Windowsでのファイルパス
http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

ファイル関連コマンドの動作確認
「機能」があるディレクトリで、glob('./*')をしても、「機能」が返り値に含まれない 

