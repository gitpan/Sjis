while (<DATA>) {
    chomp;
    if (`perl $_` =~ /Match/) {
        print "ok - perl $_\n";
    }
    else {
        print "not ok - perl $_\n";
    }
}

__END__
01kanji00.pl
02kanji01.pl
03kanji02x.pl
04kanji02.pl
