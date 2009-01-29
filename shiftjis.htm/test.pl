# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use strict;
use FindBin;
my $bin = $FindBin::Bin;
$bin =~ s#/#\\#g;

# "表示"
if (qx(perl $bin\\shiftjis.htm-01.pl) eq "\x95\x5c\x8e\xa6") {
    print "ok - shiftjis.htm-01.pl\n";
}
else {
    print "not ok - shiftjis.htm-01.pl\n";
}

# "暴力"
if (qx(perl $bin\\shiftjis.htm-02.pl) eq "\x96\x5c\x97\xcd") {
    print "ok - shiftjis.htm-02.pl\n";
}
else {
    print "not ok - shiftjis.htm-02.pl\n";
}

# 'ミソ\500'
if (qx(perl $bin\\shiftjis.htm-03.pl) eq "\x83\x7e\x83\x5c\x5c\x35\x30\x30") {
    print "ok - shiftjis.htm-03.pl\n";
}
else {
    print "not ok - shiftjis.htm-03.pl\n";
}

# q(ミソ\500)
if (qx(perl $bin\\shiftjis.htm-04.pl) eq "\x83\x7e\x83\x5c\x5c\x35\x30\x30") {
    print "ok - shiftjis.htm-04.pl\n";
}
else {
    print "not ok - shiftjis.htm-04.pl\n";
}

# "丸十net"
if (qx(perl $bin\\shiftjis.htm-05.pl) eq "\x8a\xdb\x8f\x5c\x6e\x65\x74") {
    print "ok - shiftjis.htm-05.pl\n";
}
else {
    print "not ok - shiftjis.htm-05.pl\n";
}

# "引数　ARGV"
if (qx(perl $bin\\shiftjis.htm-06.pl) eq "\x88\xf8\x90\x94\x81\x40\x41\x52\x47\x56") {
    print "ok - shiftjis.htm-06.pl\n";
}
else {
    print "not ok - shiftjis.htm-06.pl\n";
}

# "犬　dog"
if (qx(perl $bin\\shiftjis.htm-07.pl) eq "\x8c\xa2\x81\x40\x64\x6f\x67") {
    print "ok - shiftjis.htm-07.pl\n";
}
else {
    print "not ok - shiftjis.htm-07.pl\n";
}

# "花　\flower"                                        \f
if (qx(perl $bin\\shiftjis.htm-08.pl) eq "\x89\xd4\x81\x40\f\x6c\x6f\x77\x65\x72") {
    print "ok - shiftjis.htm-08.pl\n";
}
else {
    print "not ok - shiftjis.htm-08.pl\n";
}

# "犬　dog"
if ($] >= 5.00601) {
    if (qx(perl $bin\\shiftjis.htm-09.pl) eq "\x8c\xa2\x81") {
        print "ok - shiftjis.htm-09.pl\n";
    }
    else {
        print "not ok - shiftjis.htm-09.pl\n";
    }
}
else {
    print "ok - shiftjis.htm-09.pl\n";
}

# "対応表"
if (qx(perl $bin\\shiftjis.htm-10.pl) eq "\x91\xce\x89\x9e\x95\x5c") {
    print "ok - shiftjis.htm-10.pl\n";
}
else {
    print "not ok - shiftjis.htm-10.pl\n";
}

# qq{"日本語"}
if (qx(perl $bin\\shiftjis.htm-11.pl) eq "\x22\x93\xfa\x96\x7b\x8c\xea\x22") {
    print "ok - shiftjis.htm-11.pl\n";
}
else {
    print "not ok - shiftjis.htm-11.pl\n";
}

# "<img alt=\"対応表\" height=115 width=150>"
#                                        <   i   m   g       a   l   t   =   \"  対      応      表      \"      h   e   i   g   h   t   =   1   1   5       w   i   d   t   h   =   1   5   0   >
if (qx(perl $bin\\shiftjis.htm-12.pl) eq "\x3c\x69\x6d\x67\x20\x61\x6c\x74\x3d\x22\x91\xce\x89\x9e\x95\x5c\x22\x20\x68\x65\x69\x67\x68\x74\x3d\x31\x31\x35\x20\x77\x69\x64\x74\x68\x3d\x31\x35\x30\x3e") {
    print "ok - shiftjis.htm-12.pl\n";
}
else {
    print "not ok - shiftjis.htm-12.pl\n";
}

# "対応表", "なんでもいいけど"
#                                        対      応      表      な      ん      で      も      い      い      け      ど
if (qx(perl $bin\\shiftjis.htm-13.pl) eq "\x91\xce\x89\x9e\x95\x5c\x82\xc8\x82\xf1\x82\xc5\x82\xe0\x82\xa2\x82\xa2\x82\xaf\x82\xc7") {
    print "ok - shiftjis.htm-13.pl\n";
}
else {
    print "not ok - shiftjis.htm-13.pl\n";
}

# q{マッチ}
if (qx(perl $bin\\shiftjis.htm-14.pl 2>NUL) eq "\x83\x7d\x83\x62\x83\x60") {
    print "ok - shiftjis.htm-14.pl\n";
}
else {
    print "not ok - shiftjis.htm-14.pl\n";
}

# "ヤカン" =~ /ポット/
if (qx(perl $bin\\shiftjis.htm-15.pl) eq "0") {
    print "ok - shiftjis.htm-15.pl\n";
}
else {
    print "not ok - shiftjis.htm-15.pl\n";
}

# "兄弟" =~ /Z/
if (qx(perl $bin\\shiftjis.htm-16.pl) eq "0") {
    print "ok - shiftjis.htm-16.pl\n";
}
else {
    print "not ok - shiftjis.htm-16.pl\n";
}

# "運転免許" =~ /運転/
if (qx(perl $bin\\shiftjis.htm-17.pl) eq "1") {
    print "ok - shiftjis.htm-17.pl\n";
}
else {
    print "not ok - shiftjis.htm-17.pl\n";
}

# "運転免許" =~ m'運転'
if (qx(perl $bin\\shiftjis.htm-18.pl) eq "1") {
    print "ok - shiftjis.htm-18.pl\n";
}
else {
    print "not ok - shiftjis.htm-18.pl\n";
}

# /表/
if (qx(perl $bin\\shiftjis.htm-19.pl) eq "1") {
    print "ok - shiftjis.htm-19.pl\n";
}
else {
    print "not ok - shiftjis.htm-19.pl\n";
}

# s/表/裏/;
if (qx(perl $bin\\shiftjis.htm-20.pl) eq "1") {
    print "ok - shiftjis.htm-20.pl\n";
}
else {
    print "not ok - shiftjis.htm-20.pl\n";
}

# /プール/
if (qx(perl $bin\\shiftjis.htm-21.pl) eq "1") {
    print "ok - shiftjis.htm-21.pl\n";
}
else {
    print "not ok - shiftjis.htm-21.pl\n";
}

# lc('アイウエオ')
if (qx(perl $bin\\shiftjis.htm-22.pl) eq "\x83\x41\x83\x43\x83\x45\x83\x47\x83\x49") {
    print "ok - shiftjis.htm-22.pl\n";
}
else {
    print "not ok - shiftjis.htm-22.pl\n";
}

__END__

Shift-JISテキストを正しく扱う
http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm
