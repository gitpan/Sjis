use Sjis;

if ('あAい' =~ /あ[^^]い/) {
    print "ok - $^X jperlre108.pl ('あAい' =~ /あ[^^]い/)\n";
}
else {
    print "not ok - $^X jperlre108.pl ('あAい' =~ /あ[^^]い/)\n";
}

__END__

