use Sjis;

if ('あxう' =~ /(あいう)/) {
    print "not ok - $^X jperlre003.pl not ('あxう' =~ /あいう/).\n";
}
else {
    print "ok - $^X jperlre003.pl not ('あxう' =~ /あいう/).\n";
}

__END__

