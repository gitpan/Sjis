use Sjis;

if ('あいq' =~ /(あい{1,}いう)/) {
    print "not ok - $^X jperlre017.pl not ('あいq' =~ /あい{1,}いう/).\n";
}
else {
    print "ok - $^X jperlre017.pl not ('あいq' =~ /あい{1,}いう/).\n";
}

__END__

