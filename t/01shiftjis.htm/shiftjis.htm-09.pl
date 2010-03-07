# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# Possible unintended interpolation of @dog in string (Perl 5.6.1以降)
# 文字列の中で、@dogが予期せずに展開される
print "犬　dog";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "犬―@dog";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
