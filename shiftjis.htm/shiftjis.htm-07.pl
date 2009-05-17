# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

# In string, @dog now must be written as \@dog (Perl 5.6.0まで)
# 「文字列の中では、@dogは今は\@dogと書かなければならない」
print "犬　dog";

__END__

Sjis.pm の処理結果が以下になることを期待している

print "犬―@dog";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
