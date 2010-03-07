# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Esjis::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト

my $__FILE__ = __FILE__;

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if (((Esjis::r 'file') ne '') == ((-r 'file') ne '')) {
    print "ok - Esjis::r 'file' == -r 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::r 'file' == -r 'file' $^X $__FILE__\n";
}

if (((Esjis::r FILE) ne '') == ((-r FILE) ne '')) {
    print "ok - Esjis::r FILE == -r FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::r FILE == -r FILE $^X $__FILE__\n";
}

if (((Esjis::w 'file') ne '') == ((-w 'file') ne '')) {
    print "ok - Esjis::w 'file' == -w 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::w 'file' == -w 'file' $^X $__FILE__\n";
}

if (((Esjis::w FILE) ne '') == ((-w FILE) ne '')) {
    print "ok - Esjis::w FILE == -w FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::w FILE == -w FILE $^X $__FILE__\n";
}

if (((Esjis::x 'file') ne '') == ((-x 'file') ne '')) {
    print "ok - Esjis::x 'file' == -x 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::x 'file' == -x 'file' $^X $__FILE__\n";
}

if (((Esjis::x FILE) ne '') == ((-x FILE) ne '')) {
    print "ok - Esjis::x FILE == -x FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::x FILE == -x FILE $^X $__FILE__\n";
}

if (((Esjis::o 'file') ne '') == ((-o 'file') ne '')) {
    print "ok - Esjis::o 'file' == -o 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::o 'file' == -o 'file' $^X $__FILE__\n";
}

if (((Esjis::o FILE) ne '') == ((-o FILE) ne '')) {
    print "ok - Esjis::o FILE == -o FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::o FILE == -o FILE $^X $__FILE__\n";
}

if (((Esjis::R 'file') ne '') == ((-R 'file') ne '')) {
    print "ok - Esjis::R 'file' == -R 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::R 'file' == -R 'file' $^X $__FILE__\n";
}

if (((Esjis::R FILE) ne '') == ((-R FILE) ne '')) {
    print "ok - Esjis::R FILE == -R FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::R FILE == -R FILE $^X $__FILE__\n";
}

if (((Esjis::W 'file') ne '') == ((-W 'file') ne '')) {
    print "ok - Esjis::W 'file' == -W 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::W 'file' == -W 'file' $^X $__FILE__\n";
}

if (((Esjis::W FILE) ne '') == ((-W FILE) ne '')) {
    print "ok - Esjis::W FILE == -W FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::W FILE == -W FILE $^X $__FILE__\n";
}

if (((Esjis::X 'file') ne '') == ((-X 'file') ne '')) {
    print "ok - Esjis::X 'file' == -X 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::X 'file' == -X 'file' $^X $__FILE__\n";
}

if (((Esjis::X FILE) ne '') == ((-X FILE) ne '')) {
    print "ok - Esjis::X FILE == -X FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::X FILE == -X FILE $^X $__FILE__\n";
}

if (((Esjis::O 'file') ne '') == ((-O 'file') ne '')) {
    print "ok - Esjis::O 'file' == -O 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::O 'file' == -O 'file' $^X $__FILE__\n";
}

if (((Esjis::O FILE) ne '') == ((-O FILE) ne '')) {
    print "ok - Esjis::O FILE == -O FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::O FILE == -O FILE $^X $__FILE__\n";
}

if (((Esjis::e 'file') ne '') == ((-e 'file') ne '')) {
    print "ok - Esjis::e 'file' == -e 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::e 'file' == -e 'file' $^X $__FILE__\n";
}

if (((Esjis::e FILE) ne '') == ((-e FILE) ne '')) {
    print "ok - Esjis::e FILE == -e FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::e FILE == -e FILE $^X $__FILE__\n";
}

if (((Esjis::z 'file') ne '') == ((-z 'file') ne '')) {
    print "ok - Esjis::z 'file' == -z 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::z 'file' == -z 'file' $^X $__FILE__\n";
}

if (((Esjis::z FILE) ne '') == ((-z FILE) ne '')) {
    print "ok - Esjis::z FILE == -z FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::z FILE == -z FILE $^X $__FILE__\n";
}

if (((Esjis::s 'file') ne '') == ((-s 'file') ne '')) {
    print "ok - Esjis::s 'file' == -s 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::s 'file' == -s 'file' $^X $__FILE__\n";
}

if (((Esjis::s FILE) ne '') == ((-s FILE) ne '')) {
    print "ok - Esjis::s FILE == -s FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::s FILE == -s FILE $^X $__FILE__\n";
}

if (((Esjis::f 'file') ne '') == ((-f 'file') ne '')) {
    print "ok - Esjis::f 'file' == -f 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::f 'file' == -f 'file' $^X $__FILE__\n";
}

if (((Esjis::f FILE) ne '') == ((-f FILE) ne '')) {
    print "ok - Esjis::f FILE == -f FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::f FILE == -f FILE $^X $__FILE__\n";
}

if (((Esjis::d 'file') ne '') == ((-d 'file') ne '')) {
    print "ok - Esjis::d 'file' == -d 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::d 'file' == -d 'file' $^X $__FILE__\n";
}

if (((Esjis::d FILE) ne '') == ((-d FILE) ne '')) {
    print "ok - Esjis::d FILE == -d FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::d FILE == -d FILE $^X $__FILE__\n";
}

if (((Esjis::p 'file') ne '') == ((-p 'file') ne '')) {
    print "ok - Esjis::p 'file' == -p 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::p 'file' == -p 'file' $^X $__FILE__\n";
}

if (((Esjis::p FILE) ne '') == ((-p FILE) ne '')) {
    print "ok - Esjis::p FILE == -p FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::p FILE == -p FILE $^X $__FILE__\n";
}

if (((Esjis::S 'file') ne '') == ((-S 'file') ne '')) {
    print "ok - Esjis::S 'file' == -S 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::S 'file' == -S 'file' $^X $__FILE__\n";
}

if (((Esjis::S FILE) ne '') == ((-S FILE) ne '')) {
    print "ok - Esjis::S FILE == -S FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::S FILE == -S FILE $^X $__FILE__\n";
}

if (((Esjis::b 'file') ne '') == ((-b 'file') ne '')) {
    print "ok - Esjis::b 'file' == -b 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::b 'file' == -b 'file' $^X $__FILE__\n";
}

if (((Esjis::b FILE) ne '') == ((-b FILE) ne '')) {
    print "ok - Esjis::b FILE == -b FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::b FILE == -b FILE $^X $__FILE__\n";
}

if (((Esjis::c 'file') ne '') == ((-c 'file') ne '')) {
    print "ok - Esjis::c 'file' == -c 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::c 'file' == -c 'file' $^X $__FILE__\n";
}

if (((Esjis::c FILE) ne '') == ((-c FILE) ne '')) {
    print "ok - Esjis::c FILE == -c FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::c FILE == -c FILE $^X $__FILE__\n";
}

if (((Esjis::t 'file') ne '') == ((-t 'file') ne '')) {
    print "ok - Esjis::t 'file' == -t 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::t 'file' == -t 'file' $^X $__FILE__\n";
}

if (((Esjis::t FILE) ne '') == ((-t FILE) ne '')) {
    print "ok - Esjis::t FILE == -t FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::t FILE == -t FILE $^X $__FILE__\n";
}

if (((Esjis::u 'file') ne '') == ((-u 'file') ne '')) {
    print "ok - Esjis::u 'file' == -u 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::u 'file' == -u 'file' $^X $__FILE__\n";
}

if (((Esjis::u FILE) ne '') == ((-u FILE) ne '')) {
    print "ok - Esjis::u FILE == -u FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::u FILE == -u FILE $^X $__FILE__\n";
}

if (((Esjis::g 'file') ne '') == ((-g 'file') ne '')) {
    print "ok - Esjis::g 'file' == -g 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::g 'file' == -g 'file' $^X $__FILE__\n";
}

if (((Esjis::g FILE) ne '') == ((-g FILE) ne '')) {
    print "ok - Esjis::g FILE == -g FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::g FILE == -g FILE $^X $__FILE__\n";
}

if (((Esjis::k 'file') ne '') == ((-k 'file') ne '')) {
    print "ok - Esjis::k 'file' == -k 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::k 'file' == -k 'file' $^X $__FILE__\n";
}

if (((Esjis::k FILE) ne '') == ((-k FILE) ne '')) {
    print "ok - Esjis::k FILE == -k FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::k FILE == -k FILE $^X $__FILE__\n";
}

if (((Esjis::T 'file') ne '') == ((-T 'file') ne '')) {
    print "ok - Esjis::T 'file' == -T 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::T 'file' == -T 'file' $^X $__FILE__\n";
}

if (((Esjis::T FILE) ne '') == ((-T FILE) ne '')) {
    print "ok - Esjis::T FILE == -T FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::T FILE == -T FILE $^X $__FILE__\n";
}

if (((Esjis::B 'file') ne '') == ((-B 'file') ne '')) {
    print "ok - Esjis::B 'file' == -B 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::B 'file' == -B 'file' $^X $__FILE__\n";
}

if (((Esjis::B FILE) ne '') == ((-B FILE) ne '')) {
    print "ok - Esjis::B FILE == -B FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::B FILE == -B FILE $^X $__FILE__\n";
}

if (((Esjis::M 'file') ne '') == ((-M 'file') ne '')) {
    print "ok - Esjis::M 'file' == -M 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::M 'file' == -M 'file' $^X $__FILE__\n";
}

if (((Esjis::M FILE) ne '') == ((-M FILE) ne '')) {
    print "ok - Esjis::M FILE == -M FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::M FILE == -M FILE $^X $__FILE__\n";
}

if (((Esjis::A 'file') ne '') == ((-A 'file') ne '')) {
    print "ok - Esjis::A 'file' == -A 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::A 'file' == -A 'file' $^X $__FILE__\n";
}

if (((Esjis::A FILE) ne '') == ((-A FILE) ne '')) {
    print "ok - Esjis::A FILE == -A FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::A FILE == -A FILE $^X $__FILE__\n";
}

if (((Esjis::C 'file') ne '') == ((-C 'file') ne '')) {
    print "ok - Esjis::C 'file' == -C 'file' $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::C 'file' == -C 'file' $^X $__FILE__\n";
}

if (((Esjis::C FILE) ne '') == ((-C FILE) ne '')) {
    print "ok - Esjis::C FILE == -C FILE $^X $__FILE__\n";
}
else {
    print "not ok - Esjis::C FILE == -C FILE $^X $__FILE__\n";
}

__END__
