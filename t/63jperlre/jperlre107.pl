use Sjis;

if ('あ]い' =~ /あ[^]]い/) {
    print "not ok - $^X jperlre107.pl ('あ]い' =~ /あ[^]]い/)\n";
}
else {
    print "ok - $^X jperlre107.pl ('あ]い' =~ /あ[^]]い/)\n";
}

__END__

