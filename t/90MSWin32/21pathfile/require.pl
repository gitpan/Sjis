# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;
use lib qw(./);

system('echo 1 > F�@�\');

# require
eval {
    require 'F�@�\';
};
if ($@) {
    print "not ok - require: $@ $^X $__FILE__\n";
}
else {
    print "ok - require $^X $__FILE__\n";
}

__END__