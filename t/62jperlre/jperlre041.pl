use Sjis;

if ('あいう' =~ /(あ[いう]え)/) {
    print "not ok - $^X jperlre041.pl not ('あいう' =~ /あ[いう]え/).\n";
}
else {
    print "ok - $^X jperlre041.pl not ('あいう' =~ /あ[いう]え/).\n";
}

__END__

