use Sjis;

if ('ああいう' =~ /^(あいう)$/) {
    print "not ok - $^X jperlre032.pl not ('ああいう' =~ /^あいう\$/).\n";
}
else {
    print "ok - $^X jperlre032.pl not ('ああいう' =~ /^あいう\$/).\n";
}

__END__

