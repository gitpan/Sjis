use Sjis;

if ('あいいいいう' =~ /(.{3,4})/) {
    if ("$1" eq "あいいい") {
        print "ok - $^X jperlre012.pl ('あいいいいう' =~ /.{3,4}/).\n";
    }
    else {
        print "not ok - $^X jperlre012.pl ('あいいいいう' =~ /.{3,4}/).\n";
    }
}
else {
    print "not ok - $^X jperlre012.pl ('あいいいいう' =~ /.{3,4}/).\n";
}

__END__

