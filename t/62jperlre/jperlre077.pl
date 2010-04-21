use Sjis;

if ('‚¦ef' =~ /(()ef)/) {
    if ("$1-$2" eq "ef-") {
        print "ok - $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre077.pl ('‚¦ef' =~ /()ef/).\n";
}

__END__

