use Sjis;

if ('-' =~ /(\d)/) {
    print "not ok - $^X jperlre064.pl not ('-' =~ /\d/).\n";
}
else {
    print "ok - $^X jperlre064.pl not ('-' =~ /\d/).\n";
}

__END__

