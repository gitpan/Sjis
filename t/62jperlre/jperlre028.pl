use Sjis;

if ('あいう' =~ /(あい{0,1}う)/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre028.pl ('あいう' =~ /あい{0,1}う/).\n";
    }
    else {
        print "not ok - $^X jperlre028.pl ('あいう' =~ /あい{0,1}う/).\n";
    }
}
else {
    print "not ok - $^X jperlre028.pl ('あいう' =~ /あい{0,1}う/).\n";
}

__END__

