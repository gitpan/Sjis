use Sjis;

if ('あ]い' =~ /あ[]]い/) {
    print "ok - $^X jperlre102.pl ('あ]い' =~ /あ[]]い/)\n";
}
else {
    print "not ok - $^X jperlre102.pl ('あ]い' =~ /あ[]]い/)\n";
}

__END__

