use Sjis;

if ('あxyzえ' =~ /(あ.*う)/) {
    print "not ok - $^X jperlre040.pl not ('あxyzえ' =~ /あ.*う/).\n";
}
else {
    print "ok - $^X jperlre040.pl not ('あxyzえ' =~ /あ.*う/).\n";
}

__END__

