use Sjis;
print "1..1\n";

if ('1' =~ /([\D])/) {
    print "not ok - 1 $^X jperlre073.pl not ('1' =~ /[\D]/).\n";
}
else {
    print "ok - 1 $^X jperlre073.pl not ('1' =~ /[\D]/).\n";
}

__END__
