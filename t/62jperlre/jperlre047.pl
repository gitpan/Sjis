use Sjis;

if ('‚ -' =~ /(‚ [‚¢-])/) {
    if ("$1" eq "‚ -") {
        print "ok - $^X jperlre047.pl ('‚ -' =~ /‚ [‚¢-]/).\n";
    }
    else {
        print "not ok - $^X jperlre047.pl ('‚ -' =~ /‚ [‚¢-]/).\n";
    }
}
else {
    print "not ok - $^X jperlre047.pl ('‚ -' =~ /‚ [‚¢-]/).\n";
}

__END__

