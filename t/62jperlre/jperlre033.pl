use Sjis;

if ('ああいう' =~ /(あいう)$/) {
    if ("$1" eq "あいう") {
        print "ok - $^X jperlre033.pl ('ああいう' =~ /あいう\$/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre033.pl ('ああいう' =~ /あいう\$/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre033.pl ('ああいう' =~ /あいう\$/).\n";
}

__END__

