# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Esjis::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if (((Esjis::r 'file') ne '') == ((-r 'file') ne '')) {
    print "ok - Esjis::r 'file' == -r 'file'\n";
}
else {
    print "not ok - Esjis::r 'file' == -r 'file'\n";
}

if (((Esjis::r FILE) ne '') == ((-r FILE) ne '')) {
    print "ok - Esjis::r FILE == -r FILE\n";
}
else {
    print "not ok - Esjis::r FILE == -r FILE\n";
}

if (((Esjis::w 'file') ne '') == ((-w 'file') ne '')) {
    print "ok - Esjis::w 'file' == -w 'file'\n";
}
else {
    print "not ok - Esjis::w 'file' == -w 'file'\n";
}

if (((Esjis::w FILE) ne '') == ((-w FILE) ne '')) {
    print "ok - Esjis::w FILE == -w FILE\n";
}
else {
    print "not ok - Esjis::w FILE == -w FILE\n";
}

if (((Esjis::x 'file') ne '') == ((-x 'file') ne '')) {
    print "ok - Esjis::x 'file' == -x 'file'\n";
}
else {
    print "not ok - Esjis::x 'file' == -x 'file'\n";
}

if (((Esjis::x FILE) ne '') == ((-x FILE) ne '')) {
    print "ok - Esjis::x FILE == -x FILE\n";
}
else {
    print "not ok - Esjis::x FILE == -x FILE\n";
}

if (((Esjis::o 'file') ne '') == ((-o 'file') ne '')) {
    print "ok - Esjis::o 'file' == -o 'file'\n";
}
else {
    print "not ok - Esjis::o 'file' == -o 'file'\n";
}

if (((Esjis::o FILE) ne '') == ((-o FILE) ne '')) {
    print "ok - Esjis::o FILE == -o FILE\n";
}
else {
    print "not ok - Esjis::o FILE == -o FILE\n";
}

if (((Esjis::R 'file') ne '') == ((-R 'file') ne '')) {
    print "ok - Esjis::R 'file' == -R 'file'\n";
}
else {
    print "not ok - Esjis::R 'file' == -R 'file'\n";
}

if (((Esjis::R FILE) ne '') == ((-R FILE) ne '')) {
    print "ok - Esjis::R FILE == -R FILE\n";
}
else {
    print "not ok - Esjis::R FILE == -R FILE\n";
}

if (((Esjis::W 'file') ne '') == ((-W 'file') ne '')) {
    print "ok - Esjis::W 'file' == -W 'file'\n";
}
else {
    print "not ok - Esjis::W 'file' == -W 'file'\n";
}

if (((Esjis::W FILE) ne '') == ((-W FILE) ne '')) {
    print "ok - Esjis::W FILE == -W FILE\n";
}
else {
    print "not ok - Esjis::W FILE == -W FILE\n";
}

if (((Esjis::X 'file') ne '') == ((-X 'file') ne '')) {
    print "ok - Esjis::X 'file' == -X 'file'\n";
}
else {
    print "not ok - Esjis::X 'file' == -X 'file'\n";
}

if (((Esjis::X FILE) ne '') == ((-X FILE) ne '')) {
    print "ok - Esjis::X FILE == -X FILE\n";
}
else {
    print "not ok - Esjis::X FILE == -X FILE\n";
}

if (((Esjis::O 'file') ne '') == ((-O 'file') ne '')) {
    print "ok - Esjis::O 'file' == -O 'file'\n";
}
else {
    print "not ok - Esjis::O 'file' == -O 'file'\n";
}

if (((Esjis::O FILE) ne '') == ((-O FILE) ne '')) {
    print "ok - Esjis::O FILE == -O FILE\n";
}
else {
    print "not ok - Esjis::O FILE == -O FILE\n";
}

if (((Esjis::e 'file') ne '') == ((-e 'file') ne '')) {
    print "ok - Esjis::e 'file' == -e 'file'\n";
}
else {
    print "not ok - Esjis::e 'file' == -e 'file'\n";
}

if (((Esjis::e FILE) ne '') == ((-e FILE) ne '')) {
    print "ok - Esjis::e FILE == -e FILE\n";
}
else {
    print "not ok - Esjis::e FILE == -e FILE\n";
}

if (((Esjis::z 'file') ne '') == ((-z 'file') ne '')) {
    print "ok - Esjis::z 'file' == -z 'file'\n";
}
else {
    print "not ok - Esjis::z 'file' == -z 'file'\n";
}

if (((Esjis::z FILE) ne '') == ((-z FILE) ne '')) {
    print "ok - Esjis::z FILE == -z FILE\n";
}
else {
    print "not ok - Esjis::z FILE == -z FILE\n";
}

if (((Esjis::s 'file') ne '') == ((-s 'file') ne '')) {
    print "ok - Esjis::s 'file' == -s 'file'\n";
}
else {
    print "not ok - Esjis::s 'file' == -s 'file'\n";
}

if (((Esjis::s FILE) ne '') == ((-s FILE) ne '')) {
    print "ok - Esjis::s FILE == -s FILE\n";
}
else {
    print "not ok - Esjis::s FILE == -s FILE\n";
}

if (((Esjis::f 'file') ne '') == ((-f 'file') ne '')) {
    print "ok - Esjis::f 'file' == -f 'file'\n";
}
else {
    print "not ok - Esjis::f 'file' == -f 'file'\n";
}

if (((Esjis::f FILE) ne '') == ((-f FILE) ne '')) {
    print "ok - Esjis::f FILE == -f FILE\n";
}
else {
    print "not ok - Esjis::f FILE == -f FILE\n";
}

if (((Esjis::d 'file') ne '') == ((-d 'file') ne '')) {
    print "ok - Esjis::d 'file' == -d 'file'\n";
}
else {
    print "not ok - Esjis::d 'file' == -d 'file'\n";
}

if (((Esjis::d FILE) ne '') == ((-d FILE) ne '')) {
    print "ok - Esjis::d FILE == -d FILE\n";
}
else {
    print "not ok - Esjis::d FILE == -d FILE\n";
}

if (((Esjis::p 'file') ne '') == ((-p 'file') ne '')) {
    print "ok - Esjis::p 'file' == -p 'file'\n";
}
else {
    print "not ok - Esjis::p 'file' == -p 'file'\n";
}

if (((Esjis::p FILE) ne '') == ((-p FILE) ne '')) {
    print "ok - Esjis::p FILE == -p FILE\n";
}
else {
    print "not ok - Esjis::p FILE == -p FILE\n";
}

if (((Esjis::S 'file') ne '') == ((-S 'file') ne '')) {
    print "ok - Esjis::S 'file' == -S 'file'\n";
}
else {
    print "not ok - Esjis::S 'file' == -S 'file'\n";
}

if (((Esjis::S FILE) ne '') == ((-S FILE) ne '')) {
    print "ok - Esjis::S FILE == -S FILE\n";
}
else {
    print "not ok - Esjis::S FILE == -S FILE\n";
}

if (((Esjis::b 'file') ne '') == ((-b 'file') ne '')) {
    print "ok - Esjis::b 'file' == -b 'file'\n";
}
else {
    print "not ok - Esjis::b 'file' == -b 'file'\n";
}

if (((Esjis::b FILE) ne '') == ((-b FILE) ne '')) {
    print "ok - Esjis::b FILE == -b FILE\n";
}
else {
    print "not ok - Esjis::b FILE == -b FILE\n";
}

if (((Esjis::c 'file') ne '') == ((-c 'file') ne '')) {
    print "ok - Esjis::c 'file' == -c 'file'\n";
}
else {
    print "not ok - Esjis::c 'file' == -c 'file'\n";
}

if (((Esjis::c FILE) ne '') == ((-c FILE) ne '')) {
    print "ok - Esjis::c FILE == -c FILE\n";
}
else {
    print "not ok - Esjis::c FILE == -c FILE\n";
}

if (((Esjis::t 'file') ne '') == ((-t 'file') ne '')) {
    print "ok - Esjis::t 'file' == -t 'file'\n";
}
else {
    print "not ok - Esjis::t 'file' == -t 'file'\n";
}

if (((Esjis::t FILE) ne '') == ((-t FILE) ne '')) {
    print "ok - Esjis::t FILE == -t FILE\n";
}
else {
    print "not ok - Esjis::t FILE == -t FILE\n";
}

if (((Esjis::u 'file') ne '') == ((-u 'file') ne '')) {
    print "ok - Esjis::u 'file' == -u 'file'\n";
}
else {
    print "not ok - Esjis::u 'file' == -u 'file'\n";
}

if (((Esjis::u FILE) ne '') == ((-u FILE) ne '')) {
    print "ok - Esjis::u FILE == -u FILE\n";
}
else {
    print "not ok - Esjis::u FILE == -u FILE\n";
}

if (((Esjis::g 'file') ne '') == ((-g 'file') ne '')) {
    print "ok - Esjis::g 'file' == -g 'file'\n";
}
else {
    print "not ok - Esjis::g 'file' == -g 'file'\n";
}

if (((Esjis::g FILE) ne '') == ((-g FILE) ne '')) {
    print "ok - Esjis::g FILE == -g FILE\n";
}
else {
    print "not ok - Esjis::g FILE == -g FILE\n";
}

if (((Esjis::k 'file') ne '') == ((-k 'file') ne '')) {
    print "ok - Esjis::k 'file' == -k 'file'\n";
}
else {
    print "not ok - Esjis::k 'file' == -k 'file'\n";
}

if (((Esjis::k FILE) ne '') == ((-k FILE) ne '')) {
    print "ok - Esjis::k FILE == -k FILE\n";
}
else {
    print "not ok - Esjis::k FILE == -k FILE\n";
}

if (((Esjis::T 'file') ne '') == ((-T 'file') ne '')) {
    print "ok - Esjis::T 'file' == -T 'file'\n";
}
else {
    print "not ok - Esjis::T 'file' == -T 'file'\n";
}

if (((Esjis::T FILE) ne '') == ((-T FILE) ne '')) {
    print "ok - Esjis::T FILE == -T FILE\n";
}
else {
    print "not ok - Esjis::T FILE == -T FILE\n";
}

if (((Esjis::B 'file') ne '') == ((-B 'file') ne '')) {
    print "ok - Esjis::B 'file' == -B 'file'\n";
}
else {
    print "not ok - Esjis::B 'file' == -B 'file'\n";
}

if (((Esjis::B FILE) ne '') == ((-B FILE) ne '')) {
    print "ok - Esjis::B FILE == -B FILE\n";
}
else {
    print "not ok - Esjis::B FILE == -B FILE\n";
}

if (((Esjis::M 'file') ne '') == ((-M 'file') ne '')) {
    print "ok - Esjis::M 'file' == -M 'file'\n";
}
else {
    print "not ok - Esjis::M 'file' == -M 'file'\n";
}

if (((Esjis::M FILE) ne '') == ((-M FILE) ne '')) {
    print "ok - Esjis::M FILE == -M FILE\n";
}
else {
    print "not ok - Esjis::M FILE == -M FILE\n";
}

if (((Esjis::A 'file') ne '') == ((-A 'file') ne '')) {
    print "ok - Esjis::A 'file' == -A 'file'\n";
}
else {
    print "not ok - Esjis::A 'file' == -A 'file'\n";
}

if (((Esjis::A FILE) ne '') == ((-A FILE) ne '')) {
    print "ok - Esjis::A FILE == -A FILE\n";
}
else {
    print "not ok - Esjis::A FILE == -A FILE\n";
}

if (((Esjis::C 'file') ne '') == ((-C 'file') ne '')) {
    print "ok - Esjis::C 'file' == -C 'file'\n";
}
else {
    print "not ok - Esjis::C 'file' == -C 'file'\n";
}

if (((Esjis::C FILE) ne '') == ((-C FILE) ne '')) {
    print "ok - Esjis::C FILE == -C FILE\n";
}
else {
    print "not ok - Esjis::C FILE == -C FILE\n";
}

__END__
