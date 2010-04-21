use Sjis;

eval q!'AAA' =~ /[]/!;
if ($@) {
    print "ok - $^X jperlre110.pl (!'AAA' =~ /[]/!)\n";
}
else {
    print "not ok - $^X jperlre110.pl (!'AAA' =~ /[]/!)\n";
}

__END__

