use Sjis;

if ('あいx' =~ /(あいう)/) {
    print "not ok - $^X jperlre004.pl not ('あいx' =~ /あいう/).\n";
}
else {
    print "ok - $^X jperlre004.pl not ('あいx' =~ /あいう/).\n";
}

__END__

