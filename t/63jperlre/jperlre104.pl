use Sjis;

if ('あAい' =~ /あ[^]]い/) {
    print "ok - $^X jperlre104.pl ('あAい' =~ /あ[^]]い/)\n";
}
else {
    print "not ok - $^X jperlre104.pl ('あAい' =~ /あ[^]]い/)\n";
}

__END__

