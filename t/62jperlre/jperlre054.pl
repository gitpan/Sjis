use Sjis;

if ('あいえ' =~ /(あ[^いう]え)/) {
    print "not ok - $^X jperlre054.pl not ('あいえ' =~ /あ[^いう]え/).\n";
}
else {
    print "ok - $^X jperlre054.pl not ('あいえ' =~ /あ[^いう]え/).\n";
}

__END__

