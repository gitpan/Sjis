use Sjis;

eval q< '-' =~ /(あ[い-あ])/ >;
if ($@) {
    print "ok - $^X jperlre048.pl die ('-' =~ /あ[い-あ]/).\n";
}
else {
    print "not ok - $^X jperlre048.pl die ('-' =~ /あ[い-あ]/).\n";
}

__END__

