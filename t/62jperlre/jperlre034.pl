use Sjis;

if ('ああいうえ' =~ /(あいう)$/) {
    print "not ok - $^X jperlre034.pl not ('ああいうえ' =~ /あいう\$/).\n";
}
else {
    print "ok - $^X jperlre034.pl not ('ああいうえ' =~ /あいう\$/).\n";
}

__END__

