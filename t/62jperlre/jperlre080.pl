use Sjis;

if ('‚¢' =~ /($‚¢)/) {
    print "not ok - $^X jperlre080.pl not ('‚¢' =~ /$‚¢/).\n";
}
else {
    print "ok - $^X jperlre080.pl not ('‚¢' =~ /$‚¢/).\n";
}

__END__

