# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

# 後読み言明 (例えば C<(?<=[A-Z])>) が直前の二バイト文字の第二バイトに
# 誤ってマッチすることには対処されていません。
# 例えば、 C<match("アイウ", '(?<=[A-Z])(\p{Kana})')> は C<('イ')>
# を返しますが、もちろん誤りです。

if ('アイウ' =~ /(?<=[A-Z])([アイウ])/) {
    print "ok - 1 # SKIP $^X 04sadahiro.pl ('アイウ' =~ /(?<=[A-Z])([アイウ])/)($1)\n";
}
else {
    print "ok - 1 $^X 04sadahiro.pl ('アイウ' =~ /(?<=[A-Z])([アイウ])/)($1)\n";
}

__END__

http://search.cpan.org/dist/ShiftJIS-Regexp/
