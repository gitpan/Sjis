# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# Esjis::X と -X (Perlのファイルテスト演算子) の結果が一致することのテスト(対象はディレクトリ)

use Esjis;

mkdir('directory',0777);

opendir(DIR,'directory');

if (((Esjis::r 'directory') ne '') == ((-r 'directory') ne '')) {
    print "ok - Esjis::r 'directory' == -r 'directory'\n";
}
else {
    print "not ok - Esjis::r 'directory' == -r 'directory'\n";
}

if (((Esjis::w 'directory') ne '') == ((-w 'directory') ne '')) {
    print "ok - Esjis::w 'directory' == -w 'directory'\n";
}
else {
    print "not ok - Esjis::w 'directory' == -w 'directory'\n";
}

if (((Esjis::x 'directory') ne '') == ((-x 'directory') ne '')) {
    print "ok - Esjis::x 'directory' == -x 'directory'\n";
}
else {
    print "not ok - Esjis::x 'directory' == -x 'directory'\n";
}

if (((Esjis::o 'directory') ne '') == ((-o 'directory') ne '')) {
    print "ok - Esjis::o 'directory' == -o 'directory'\n";
}
else {
    print "not ok - Esjis::o 'directory' == -o 'directory'\n";
}

if (((Esjis::R 'directory') ne '') == ((-R 'directory') ne '')) {
    print "ok - Esjis::R 'directory' == -R 'directory'\n";
}
else {
    print "not ok - Esjis::R 'directory' == -R 'directory'\n";
}

if (((Esjis::W 'directory') ne '') == ((-W 'directory') ne '')) {
    print "ok - Esjis::W 'directory' == -W 'directory'\n";
}
else {
    print "not ok - Esjis::W 'directory' == -W 'directory'\n";
}

if (((Esjis::X 'directory') ne '') == ((-X 'directory') ne '')) {
    print "ok - Esjis::X 'directory' == -X 'directory'\n";
}
else {
    print "not ok - Esjis::X 'directory' == -X 'directory'\n";
}

if (((Esjis::O 'directory') ne '') == ((-O 'directory') ne '')) {
    print "ok - Esjis::O 'directory' == -O 'directory'\n";
}
else {
    print "not ok - Esjis::O 'directory' == -O 'directory'\n";
}

if (((Esjis::e 'directory') ne '') == ((-e 'directory') ne '')) {
    print "ok - Esjis::e 'directory' == -e 'directory'\n";
}
else {
    print "not ok - Esjis::e 'directory' == -e 'directory'\n";
}

if (((Esjis::z 'directory') ne '') == ((-z 'directory') ne '')) {
    print "ok - Esjis::z 'directory' == -z 'directory'\n";
}
else {
    print "not ok - Esjis::z 'directory' == -z 'directory'\n";
}

if (((Esjis::s 'directory') ne '') == ((-s 'directory') ne '')) {
    print "ok - Esjis::s 'directory' == -s 'directory'\n";
}
else {
    print "not ok - Esjis::s 'directory' == -s 'directory'\n";
}

if (((Esjis::f 'directory') ne '') == ((-f 'directory') ne '')) {
    print "ok - Esjis::f 'directory' == -f 'directory'\n";
}
else {
    print "not ok - Esjis::f 'directory' == -f 'directory'\n";
}

if (((Esjis::d 'directory') ne '') == ((-d 'directory') ne '')) {
    print "ok - Esjis::d 'directory' == -d 'directory'\n";
}
else {
    print "not ok - Esjis::d 'directory' == -d 'directory'\n";
}

if (((Esjis::p 'directory') ne '') == ((-p 'directory') ne '')) {
    print "ok - Esjis::p 'directory' == -p 'directory'\n";
}
else {
    print "not ok - Esjis::p 'directory' == -p 'directory'\n";
}

if (((Esjis::S 'directory') ne '') == ((-S 'directory') ne '')) {
    print "ok - Esjis::S 'directory' == -S 'directory'\n";
}
else {
    print "not ok - Esjis::S 'directory' == -S 'directory'\n";
}

if (((Esjis::b 'directory') ne '') == ((-b 'directory') ne '')) {
    print "ok - Esjis::b 'directory' == -b 'directory'\n";
}
else {
    print "not ok - Esjis::b 'directory' == -b 'directory'\n";
}

if (((Esjis::c 'directory') ne '') == ((-c 'directory') ne '')) {
    print "ok - Esjis::c 'directory' == -c 'directory'\n";
}
else {
    print "not ok - Esjis::c 'directory' == -c 'directory'\n";
}

if (((Esjis::t 'directory') ne '') == ((-t 'directory') ne '')) {
    print "ok - Esjis::t 'directory' == -t 'directory'\n";
}
else {
    print "not ok - Esjis::t 'directory' == -t 'directory'\n";
}

if (((Esjis::u 'directory') ne '') == ((-u 'directory') ne '')) {
    print "ok - Esjis::u 'directory' == -u 'directory'\n";
}
else {
    print "not ok - Esjis::u 'directory' == -u 'directory'\n";
}

if (((Esjis::g 'directory') ne '') == ((-g 'directory') ne '')) {
    print "ok - Esjis::g 'directory' == -g 'directory'\n";
}
else {
    print "not ok - Esjis::g 'directory' == -g 'directory'\n";
}

if (((Esjis::k 'directory') ne '') == ((-k 'directory') ne '')) {
    print "ok - Esjis::k 'directory' == -k 'directory'\n";
}
else {
    print "not ok - Esjis::k 'directory' == -k 'directory'\n";
}

if (((Esjis::T 'directory') ne '') == ((-T 'directory') ne '')) {
    print "ok - Esjis::T 'directory' == -T 'directory'\n";
}
else {
    print "not ok - Esjis::T 'directory' == -T 'directory'\n";
}

if (((Esjis::B 'directory') ne '') == ((-B 'directory') ne '')) {
    print "ok - Esjis::B 'directory' == -B 'directory'\n";
}
else {
    print "not ok - Esjis::B 'directory' == -B 'directory'\n";
}

if (((Esjis::M 'directory') ne '') == ((-M 'directory') ne '')) {
    print "ok - Esjis::M 'directory' == -M 'directory'\n";
}
else {
    print "not ok - Esjis::M 'directory' == -M 'directory'\n";
}

if (((Esjis::A 'directory') ne '') == ((-A 'directory') ne '')) {
    print "ok - Esjis::A 'directory' == -A 'directory'\n";
}
else {
    print "not ok - Esjis::A 'directory' == -A 'directory'\n";
}

if (((Esjis::C 'directory') ne '') == ((-C 'directory') ne '')) {
    print "ok - Esjis::C 'directory' == -C 'directory'\n";
}
else {
    print "not ok - Esjis::C 'directory' == -C 'directory'\n";
}

__END__
