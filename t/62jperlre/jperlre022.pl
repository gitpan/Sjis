use Sjis;

if ('あいいいいう' =~ /(あい{4,5}いう)/) {
    print "not ok - $^X jperlre022.pl not ('あいいいいう' =~ /あい{4,5}いう/).\n";
}
else {
    print "ok - $^X jperlre022.pl not ('あいいいいう' =~ /あい{4,5}いう/).\n";
}

__END__

