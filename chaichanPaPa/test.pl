use Sjis;

mkdir('hoge', 0777);
system("echo 1 >hoge\\テストソース.txt");

while (<DATA>) {
    chomp;
    if (`perl $_` =~ /Match/) {
        print "ok - $_\n";
    }
    else {
        print "not ok - $_\n";
    }
}

__END__
01kanji00.pl
02kanji01.pl
03kanji02x.pl
04kanji02.pl
