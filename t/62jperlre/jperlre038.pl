use Sjis;

if ('あxう' =~ /(あ.う)/) {
    if ("$1" eq "あxう") {
        print "ok - $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
    }
    else {
        print "not ok - $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
    }
}
else {
    print "not ok - $^X jperlre038.pl ('あxう' =~ /あ.う/).\n";
}

__END__

