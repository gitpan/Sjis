use Sjis;

if ('ああう' =~ /(あ[い-え])/) {
    if ("$1" eq "あう") {
        print "ok - $^X jperlre045.pl ('ああう' =~ /あ[い-え]/).\n";
    }
    else {
        print "not ok(a:$1) - $^X jperlre045.pl ('ああう' =~ /あ[い-え]/).\n";
    }
}
else {
    print "not ok(b) - $^X jperlre045.pl ('ああう' =~ /あ[い-え]/).\n";
}

__END__

