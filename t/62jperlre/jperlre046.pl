use Sjis;

if ('‚ -' =~ /(‚ [-‚¢])/) {
    if ("$1" eq "‚ -") {
        print "ok - $^X jperlre046.pl ('‚ -' =~ /‚ [-‚¢]/).\n";
    }
    else {
        print "not ok - $^X jperlre046.pl ('‚ -' =~ /‚ [-‚¢]/).\n";
    }
}
else {
    print "not ok - $^X jperlre046.pl ('‚ -' =~ /‚ [-‚¢]/).\n";
}

__END__

