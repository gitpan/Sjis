use Sjis;

if ('あ-い' =~ /(あ\sい)/) {
    print "not ok - $^X jperlre060.pl not ('あ-い' =~ /あ\sい/).\n";
}
else {
    print "ok - $^X jperlre060.pl not ('あ-い' =~ /あ\sい/).\n";
}

__END__

