use Sjis;

if ('あいえ' =~ /(あ[いう]え)/) {
    if ("$1" eq "あいえ") {
        print "ok - $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
    }
    else {
        print "not ok - $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
    }
}
else {
    print "not ok - $^X jperlre042.pl ('あいえ' =~ /あ[いう]え/).\n";
}

__END__

