# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('あ-う' =~ /(あ[^-い]う)/) {
    print "not ok - 1 $^X $__FILE__ not ('あ-う' =~ /あ[^-い]う/).\n";
}
else {
    print "ok - 1 $^X $__FILE__ not ('あ-う' =~ /あ[^-い]う/).\n";
}

__END__
