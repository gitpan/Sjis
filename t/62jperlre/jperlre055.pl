use Sjis;

if ('あえう' =~ /(あ[^-い]う)/) {
    if ("$1" eq "あえう") {
        print "ok - $^X jperlre055.pl ('あえう' =~ /あ[^-い]う/).\n";
    }
    else {
        print "not ok - $^X jperlre055.pl ('あえう' =~ /あ[^-い]う/).\n";
    }
}
else {
    print "not ok - $^X jperlre055.pl ('あえう' =~ /あ[^-い]う/).\n";
}

__END__

