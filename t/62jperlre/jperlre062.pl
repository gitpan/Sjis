use Sjis;

if ('あ-い' =~ /(あ\Sい)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
    }
    else {
        print "not ok - $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
    }
}
else {
    print "not ok - $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
}

__END__

