use Sjis;

if ('あ-い' =~ /(あ[\s]い)/) {
    print "not ok - $^X jperlre068.pl not ('あ-い' =~ /あ[\s]い/).\n";
}
else {
    print "ok - $^X jperlre068.pl not ('あ-い' =~ /あ[\s]い/).\n";
}

__END__

