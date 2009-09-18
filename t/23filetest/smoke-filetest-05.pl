# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

# ˆø”‚ªÈ—ª‚³‚ê‚½ê‡‚ÌƒeƒXƒg

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

$_ = 'file';
if ((Esjis::r_ ne '') == (-r ne '')) {
    print "ok - Esjis::r_ == -r \n";
}
else {
    print "not ok - Esjis::r_ == -r \n";
}

$_ = 'file';
if ((Esjis::w_ ne '') == (-w ne '')) {
    print "ok - Esjis::w_ == -w \n";
}
else {
    print "not ok - Esjis::w_ == -w \n";
}

$_ = 'file';
if ((Esjis::x_ ne '') == (-x ne '')) {
    print "ok - Esjis::x_ == -x \n";
}
else {
    print "not ok - Esjis::x_ == -x \n";
}

$_ = 'file';
if ((Esjis::o_ ne '') == (-o ne '')) {
    print "ok - Esjis::o_ == -o \n";
}
else {
    print "not ok - Esjis::o_ == -o \n";
}

$_ = 'file';
if ((Esjis::R_ ne '') == (-R ne '')) {
    print "ok - Esjis::R_ == -R \n";
}
else {
    print "not ok - Esjis::R_ == -R \n";
}

$_ = 'file';
if ((Esjis::W_ ne '') == (-W ne '')) {
    print "ok - Esjis::W_ == -W \n";
}
else {
    print "not ok - Esjis::W_ == -W \n";
}

$_ = 'file';
if ((Esjis::X_ ne '') == (-X ne '')) {
    print "ok - Esjis::X_ == -X \n";
}
else {
    print "not ok - Esjis::X_ == -X \n";
}

$_ = 'file';
if ((Esjis::O_ ne '') == (-O ne '')) {
    print "ok - Esjis::O_ == -O \n";
}
else {
    print "not ok - Esjis::O_ == -O \n";
}

$_ = 'file';
if ((Esjis::e_ ne '') == (-e ne '')) {
    print "ok - Esjis::e_ == -e \n";
}
else {
    print "not ok - Esjis::e_ == -e \n";
}

$_ = 'file';
if ((Esjis::z_ ne '') == (-z ne '')) {
    print "ok - Esjis::z_ == -z \n";
}
else {
    print "not ok - Esjis::z_ == -z \n";
}

$_ = 'file';
if ((Esjis::s_ ne '') == (-s ne '')) {
    print "ok - Esjis::s_ == -s \n";
}
else {
    print "not ok - Esjis::s_ == -s \n";
}

$_ = 'file';
if ((Esjis::f_ ne '') == (-f ne '')) {
    print "ok - Esjis::f_ == -f \n";
}
else {
    print "not ok - Esjis::f_ == -f \n";
}

$_ = 'file';
if ((Esjis::d_ ne '') == (-d ne '')) {
    print "ok - Esjis::d_ == -d \n";
}
else {
    print "not ok - Esjis::d_ == -d \n";
}

$_ = 'file';
if ((Esjis::p_ ne '') == (-p ne '')) {
    print "ok - Esjis::p_ == -p \n";
}
else {
    print "not ok - Esjis::p_ == -p \n";
}

$_ = 'file';
if ((Esjis::S_ ne '') == (-S ne '')) {
    print "ok - Esjis::S_ == -S \n";
}
else {
    print "not ok - Esjis::S_ == -S \n";
}

$_ = 'file';
if ((Esjis::b_ ne '') == (-b ne '')) {
    print "ok - Esjis::b_ == -b \n";
}
else {
    print "not ok - Esjis::b_ == -b \n";
}

$_ = 'file';
if ((Esjis::c_ ne '') == (-c ne '')) {
    print "ok - Esjis::c_ == -c \n";
}
else {
    print "not ok - Esjis::c_ == -c \n";
}

$_ = 'file';
if ((Esjis::t_ ne '') == (-t ne '')) {
    print "ok - Esjis::t_ == -t \n";
}
else {
    print "not ok - Esjis::t_ == -t \n";
}

$_ = 'file';
if ((Esjis::u_ ne '') == (-u ne '')) {
    print "ok - Esjis::u_ == -u \n";
}
else {
    print "not ok - Esjis::u_ == -u \n";
}

$_ = 'file';
if ((Esjis::g_ ne '') == (-g ne '')) {
    print "ok - Esjis::g_ == -g \n";
}
else {
    print "not ok - Esjis::g_ == -g \n";
}

$_ = 'file';
if ((Esjis::k_ ne '') == (-k ne '')) {
    print "ok - Esjis::k_ == -k \n";
}
else {
    print "not ok - Esjis::k_ == -k \n";
}

$_ = 'file';
if ((Esjis::T_ ne '') == (-T ne '')) {
    print "ok - Esjis::T_ == -T \n";
}
else {
    print "not ok - Esjis::T_ == -T \n";
}

$_ = 'file';
if ((Esjis::B_ ne '') == (-B ne '')) {
    print "ok - Esjis::B_ == -B \n";
}
else {
    print "not ok - Esjis::B_ == -B \n";
}

$_ = 'file';
if ((Esjis::M_ ne '') == (-M ne '')) {
    print "ok - Esjis::M_ == -M \n";
}
else {
    print "not ok - Esjis::M_ == -M \n";
}

$_ = 'file';
if ((Esjis::A_ ne '') == (-A ne '')) {
    print "ok - Esjis::A_ == -A \n";
}
else {
    print "not ok - Esjis::A_ == -A \n";
}

$_ = 'file';
if ((Esjis::C_ ne '') == (-C ne '')) {
    print "ok - Esjis::C_ == -C \n";
}
else {
    print "not ok - Esjis::C_ == -C \n";
}

__END__
