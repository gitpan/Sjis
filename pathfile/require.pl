# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
use lib qw(./);

system('echo 1 > F�@�\');

# require
eval {
    require 'F�@�\';
};
if ($@) {
    print "not ok - require: $@\n";
}
else {
    print "ok - require\n";
}

__END__
