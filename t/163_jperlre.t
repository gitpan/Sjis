# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

if ('あ-い' =~ /(あ\Sい)/) {
    if ("-" eq "-") {
        print "ok - 1 $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
    }
    else {
        print "not ok - 1 $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
    }
}
else {
    print "not ok - 1 $^X jperlre062.pl ('あ-い' =~ /あ\Sい/).\n";
}

__END__
