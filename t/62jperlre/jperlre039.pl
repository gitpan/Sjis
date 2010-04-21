use Sjis;

if ('‚ xyz‚¤' =~ /(‚ .*‚¤)/) {
    if ("$1" eq "‚ xyz‚¤") {
        print "ok - $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
    }
    else {
        print "not ok - $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
    }
}
else {
    print "not ok - $^X jperlre039.pl ('‚ xyz‚¤' =~ /‚ .*‚¤/).\n";
}

__END__

