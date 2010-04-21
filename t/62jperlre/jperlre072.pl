use Sjis;

if ('-' =~ /([\d])/) {
    print "not ok - $^X jperlre072.pl not ('-' =~ /[\d]/).\n";
}
else {
    print "ok - $^X jperlre072.pl not ('-' =~ /[\d]/).\n";
}

__END__

