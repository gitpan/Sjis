# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..1\n";

my $__FILE__ = __FILE__;

if ('������������' =~ /(.{3,4})/) {
    if ("$1" eq "��������") {
        print "ok - 1 $^X $__FILE__ ('������������' =~ /.{3,4}/).\n";
    }
    else {
        print "not ok - 1 $^X $__FILE__ ('������������' =~ /.{3,4}/).\n";
    }
}
else {
    print "not ok - 1 $^X $__FILE__ ('������������' =~ /.{3,4}/).\n";
}

__END__