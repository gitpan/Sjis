use Sjis;

if ('あ-う' =~ /(あ[^-い]う)/) {
    print "not ok - $^X jperlre056.pl not ('あ-う' =~ /あ[^-い]う/).\n";
}
else {
    print "ok - $^X jperlre056.pl not ('あ-う' =~ /あ[^-い]う/).\n";
}

__END__

