# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

$_ = '';

# unmatched [ ] in regexp
# 「正規表現にマッチしない [ ] がある」
eval { /プール/ };
if ($@) {
    print "not ok - 1 eval { /PUURU/ }\n";
}
else {
    print "ok - 1 eval { /PUURU/ }\n";
}

__END__

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
