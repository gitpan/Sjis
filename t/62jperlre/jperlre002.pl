use Sjis;

if ('xいう' =~ /(あいう)/) {
    print "not ok - $^X jperlre002.pl not ('xいう' =~ /あいう/).\n";
}
else {
    print "ok - $^X jperlre002.pl not ('xいう' =~ /あいう/).\n";
}

__END__

