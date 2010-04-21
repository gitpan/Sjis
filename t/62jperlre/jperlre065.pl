use Sjis;

if ('1' =~ /(\D)/) {
    print "not ok - $^X jperlre065.pl not ('1' =~ /\D/).\n";
}
else {
    print "ok - $^X jperlre065.pl not ('1' =~ /\D/).\n";
}

__END__

