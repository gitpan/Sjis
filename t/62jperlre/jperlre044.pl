use Sjis;

if ('あうe' =~ /(あ[い-え]e)/) {
    if ("$1" eq "あうe") {
        print "ok - $^X jperlre044.pl ('あうe' =~ /あ[い-え]e/).\n";
    }
    else {
        print "not ok - $^X jperlre044.pl ('あうe' =~ /あ[い-え]e/).\n";
    }
}
else {
    print "not ok - $^X jperlre044.pl ('あうe' =~ /あ[い-え]e/).\n";
}

__END__

