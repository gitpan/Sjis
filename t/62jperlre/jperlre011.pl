use Sjis;

if ('あいいいいう' =~ /(.{1})/) {
    if ("$1" eq "あ") {
        print "ok - $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
    }
    else {
        print "not ok - $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
    }
}
else {
    print "not ok - $^X jperlre011.pl ('あいいいいう' =~ /.{1}/).\n";
}

__END__

