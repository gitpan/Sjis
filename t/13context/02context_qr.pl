use Sjis;

# /g なしのスカラーコンテキスト
my $success = "アソア" =~ qr/ソ/;
if ($success) {
    print qq{ok - 1 "アソア" =~ qr/ソ/\n};
}
else {
    print qq{not ok - 1 "アソア" =~ qr/ソ/\n};
}

# /g なしのリストコンテキスト
if (my($c1,$c2,$c3,$c4) = "サシスセソタチツテト" =~ qr/^...(.)(.)(.)(.)...$/) {
    if ("($c1)($c2)($c3)($c4)" eq "(セ)(ソ)(タ)(チ)") {
        print "ok - 2 ($c1)($c2)($c3)($c4)\n";
    }
    else {
        print "not ok - 2 ($c1)($c2)($c3)($c4)\n";
    }
}
else {
    print "not ok - 2 ($c1)($c2)($c3)($c4)\n";
}

