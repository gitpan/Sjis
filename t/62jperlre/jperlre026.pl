use Sjis;

if ('あいいいいう' =~ /(あい?いう)/) {
    print "not ok - $^X jperlre026.pl not ('あいいいいう' =~ /あい?いう/).\n";
}
else {
    print "ok - $^X jperlre026.pl not ('あいいいいう' =~ /あい?いう/).\n";
}

__END__

