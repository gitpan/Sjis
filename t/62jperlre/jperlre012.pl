use Sjis;

if ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /(.{3,4})/) {
    if ("$1" eq "‚ ‚¢‚¢‚¢") {
        print "ok - $^X jperlre012.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{3,4}/).\n";
    }
    else {
        print "not ok - $^X jperlre012.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{3,4}/).\n";
    }
}
else {
    print "not ok - $^X jperlre012.pl ('‚ ‚¢‚¢‚¢‚¢‚¤' =~ /.{3,4}/).\n";
}

__END__

