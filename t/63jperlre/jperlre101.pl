use Sjis;

if ('あ-い' =~ /あ[-]い/) {
    print "ok - $^X jperlre101.pl ('あ-い' =~ /あ[-]い/)\n";
}
else {
    print "not ok - $^X jperlre101.pl ('あ-い' =~ /あ[-]い/)\n";
}

__END__

