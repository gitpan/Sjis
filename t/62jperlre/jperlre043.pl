use Sjis;

if ('あいえ' =~ /(あ[い-え]e)/) {
    print "not ok - $^X jperlre043.pl not ('あいえ' =~ /あ[い-え]e/).\n";
}
else {
    print "ok - $^X jperlre043.pl not ('あいえ' =~ /あ[い-え]e/).\n";
}

__END__

