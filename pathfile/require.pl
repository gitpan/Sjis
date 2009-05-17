# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;
use lib qw(./);

system('echo 1 > F機能');

# require
eval {
    require 'F機能';
};
if ($@) {
    print "not ok - require: $@\n";
}
else {
    print "ok - require\n";
}

__END__
