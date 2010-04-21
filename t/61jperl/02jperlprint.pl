use Sjis;

open(TMP,'>Kanji_xxx.tmp') || die "Can't open file: Kanji_xxx.tmp\n";
print TMP <<EOL;
‚ ‚¢‚¤    align
abcde ‚¨  align
‚©‚«‚­‚¯  align
‚±        align
EOL
close(TMP);

$CAT = 'perl -e "print <>"';
if (`$CAT Kanji_xxx.tmp` eq <<EOL) {
‚ ‚¢‚¤    align
abcde ‚¨  align
‚©‚«‚­‚¯  align
‚±        align
EOL
    print "ok - 1 $^X 02jperlprint.pl\n";
    unlink "Kanji_xxx.tmp";
}
else {
    print "not ok - 1 $^X 02jperlprint.pl\n";
}

__END__
