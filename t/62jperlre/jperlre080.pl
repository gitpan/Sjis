use Sjis;

if ('い' =~ /($い)/) {
    print "not ok - $^X jperlre080.pl not ('い' =~ /$い/).\n";
}
else {
    print "ok - $^X jperlre080.pl not ('い' =~ /$い/).\n";
}

__END__

