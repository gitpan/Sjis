# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# In string, @dog now must be written as \@dog (Perl 5.6.0まで)
# 「文字列の中では、@dogは今は\@dogと書かなければならない」
print "花　\flower";

__END__

esjis.pl の処理結果が以下になることを期待している

print "花―@\flower";

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
