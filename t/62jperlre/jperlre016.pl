use Sjis;

if ('あいq' =~ /(あい+いう)/) {
    print "not ok - $^X jperlre016.pl not ('あいq' =~ /あい+いう/).\n";
}
else {
    print "ok - $^X jperlre016.pl not ('あいq' =~ /あい+いう/).\n";
}

__END__

