use Sjis;

if ('あ い' =~ /(あ\Sい)/) {
    print "not ok - $^X jperlre061.pl not ('あ い' =~ /あ\Sい/).\n";
}
else {
    print "ok - $^X jperlre061.pl not ('あ い' =~ /あ\Sい/).\n";
}

__END__

