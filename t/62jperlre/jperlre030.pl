use Sjis;

if ('あいうう' =~ /^(あいう)$/) {
    print "not ok - $^X jperlre030.pl not ('あいうう' =~ /^あいう\$/).\n";
}
else {
    print "ok - $^X jperlre030.pl not ('あいうう' =~ /^あいう\$/).\n";
}

__END__

