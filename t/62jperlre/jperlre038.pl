use Sjis;

if ('‚ x‚¤' =~ /(‚ .‚¤)/) {
    if ("$1" eq "‚ x‚¤") {
        print "ok - $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre038.pl ('‚ x‚¤' =~ /‚ .‚¤/).\n";
}

__END__

