use Sjis;

if ('あeえ' =~ /(あ[^いう]え)/) {
    if ("$1" eq "あeえ") {
        print "ok - $^X jperlre053.pl ('あeえ' =~ /あ[^いう]え/).\n";
    }
    else {
        print "not ok - $^X jperlre053.pl ('あeえ' =~ /あ[^いう]え/).\n";
    }
}
else {
    print "not ok - $^X jperlre053.pl ('あeえ' =~ /あ[^いう]え/).\n";
}

__END__

