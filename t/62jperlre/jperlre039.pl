use Sjis;

if ('あxyzう' =~ /(あ.*う)/) {
    if ("$1" eq "あxyzう") {
        print "ok - $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
    }
    else {
        print "not ok - $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
    }
}
else {
    print "not ok - $^X jperlre039.pl ('あxyzう' =~ /あ.*う/).\n";
}

__END__

