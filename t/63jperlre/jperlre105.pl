use Sjis;

if ('あA]い' =~ /あ[^]]い/) {
    print "not ok - $^X jperlre105.pl ('あA]い' =~ /あ[^]]い/)\n";
}
else {
    print "ok - $^X jperlre105.pl ('あA]い' =~ /あ[^]]い/)\n";
}

__END__

