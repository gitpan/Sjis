use Sjis;

if ('あいう' =~ /(あい+いう)/) {
    print "not ok - $^X jperlre015.pl not ('あいう' =~ /あい+いう/).\n";
}
else {
    print "ok - $^X jperlre015.pl not ('あいう' =~ /あい+いう/).\n";
}

__END__

