use Sjis;

if ('あ い' =~ /(あ\sい)/) {
    if ("-" eq "-") {
        print "ok - $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
    }
    else {
        print "not ok - $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
    }
}
else {
    print "not ok - $^X jperlre059.pl ('あ い' =~ /あ\sい/).\n";
}

__END__

