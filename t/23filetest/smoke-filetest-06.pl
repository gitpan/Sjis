# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 引数に _ が指定された場合のテスト

use Esjis;

open(FILE,'>file');
close(FILE);

open(FILE,'file');

if (-r ('file')) {
    if (Esjis::r(_)) {
        print "ok - Esjis::r _ == -r _\n";
    }
    else {
        print "not ok - Esjis::r _ == -r _\n";
    }
}
else {
    if (Esjis::r(_)) {
        print "not ok - Esjis::r _ == -r _\n";
    }
    else {
        print "ok - Esjis::r _ == -r _\n";
    }
}

if (-w ('file')) {
    if (Esjis::w(_)) {
        print "ok - Esjis::w _ == -w _\n";
    }
    else {
        print "not ok - Esjis::w _ == -w _\n";
    }
}
else {
    if (Esjis::w(_)) {
        print "not ok - Esjis::w _ == -w _\n";
    }
    else {
        print "ok - Esjis::w _ == -w _\n";
    }
}

if (-x ('file')) {
    if (Esjis::x(_)) {
        print "ok - Esjis::x _ == -x _\n";
    }
    else {
        print "not ok - Esjis::x _ == -x _\n";
    }
}
else {
    if (Esjis::x(_)) {
        print "not ok - Esjis::x _ == -x _\n";
    }
    else {
        print "ok - Esjis::x _ == -x _\n";
    }
}

if (-o ('file')) {
    if (Esjis::o(_)) {
        print "ok - Esjis::o _ == -o _\n";
    }
    else {
        print "not ok - Esjis::o _ == -o _\n";
    }
}
else {
    if (Esjis::o(_)) {
        print "not ok - Esjis::o _ == -o _\n";
    }
    else {
        print "ok - Esjis::o _ == -o _\n";
    }
}

if (-R ('file')) {
    if (Esjis::R(_)) {
        print "ok - Esjis::R _ == -R _\n";
    }
    else {
        print "not ok - Esjis::R _ == -R _\n";
    }
}
else {
    if (Esjis::R(_)) {
        print "not ok - Esjis::R _ == -R _\n";
    }
    else {
        print "ok - Esjis::R _ == -R _\n";
    }
}

if (-W ('file')) {
    if (Esjis::W(_)) {
        print "ok - Esjis::W _ == -W _\n";
    }
    else {
        print "not ok - Esjis::W _ == -W _\n";
    }
}
else {
    if (Esjis::W(_)) {
        print "not ok - Esjis::W _ == -W _\n";
    }
    else {
        print "ok - Esjis::W _ == -W _\n";
    }
}

if (-X ('file')) {
    if (Esjis::X(_)) {
        print "ok - Esjis::X _ == -X _\n";
    }
    else {
        print "not ok - Esjis::X _ == -X _\n";
    }
}
else {
    if (Esjis::X(_)) {
        print "not ok - Esjis::X _ == -X _\n";
    }
    else {
        print "ok - Esjis::X _ == -X _\n";
    }
}

if (-O ('file')) {
    if (Esjis::O(_)) {
        print "ok - Esjis::O _ == -O _\n";
    }
    else {
        print "not ok - Esjis::O _ == -O _\n";
    }
}
else {
    if (Esjis::O(_)) {
        print "not ok - Esjis::O _ == -O _\n";
    }
    else {
        print "ok - Esjis::O _ == -O _\n";
    }
}

if (-e ('file')) {
    if (Esjis::e(_)) {
        print "ok - Esjis::e _ == -e _\n";
    }
    else {
        print "not ok - Esjis::e _ == -e _\n";
    }
}
else {
    if (Esjis::e(_)) {
        print "not ok - Esjis::e _ == -e _\n";
    }
    else {
        print "ok - Esjis::e _ == -e _\n";
    }
}

if (-z ('file')) {
    if (Esjis::z(_)) {
        print "ok - Esjis::z _ == -z _\n";
    }
    else {
        print "not ok - Esjis::z _ == -z _\n";
    }
}
else {
    if (Esjis::z(_)) {
        print "not ok - Esjis::z _ == -z _\n";
    }
    else {
        print "ok - Esjis::z _ == -z _\n";
    }
}

$_ = -s 'file';
if (Esjis::s(_) == $_) {
    print "ok - Esjis::s _ (@{[Esjis::s _]}) == -s 'file' ($_)\n";
}
else {
    print "not ok - Esjis::s _ (@{[Esjis::s _]}) == -s 'file' ($_)\n";
}
if (-f ('file')) {
    if (Esjis::f(_)) {
        print "ok - Esjis::f _ == -f _\n";
    }
    else {
        print "not ok - Esjis::f _ == -f _\n";
    }
}
else {
    if (Esjis::f(_)) {
        print "not ok - Esjis::f _ == -f _\n";
    }
    else {
        print "ok - Esjis::f _ == -f _\n";
    }
}

if (-d ('file')) {
    if (Esjis::d(_)) {
        print "ok - Esjis::d _ == -d _\n";
    }
    else {
        print "not ok - Esjis::d _ == -d _\n";
    }
}
else {
    if (Esjis::d(_)) {
        print "not ok - Esjis::d _ == -d _\n";
    }
    else {
        print "ok - Esjis::d _ == -d _\n";
    }
}

if (-p ('file')) {
    if (Esjis::p(_)) {
        print "ok - Esjis::p _ == -p _\n";
    }
    else {
        print "not ok - Esjis::p _ == -p _\n";
    }
}
else {
    if (Esjis::p(_)) {
        print "not ok - Esjis::p _ == -p _\n";
    }
    else {
        print "ok - Esjis::p _ == -p _\n";
    }
}

if (-S ('file')) {
    if (Esjis::S(_)) {
        print "ok - Esjis::S _ == -S _\n";
    }
    else {
        print "not ok - Esjis::S _ == -S _\n";
    }
}
else {
    if (Esjis::S(_)) {
        print "not ok - Esjis::S _ == -S _\n";
    }
    else {
        print "ok - Esjis::S _ == -S _\n";
    }
}

if (-b ('file')) {
    if (Esjis::b(_)) {
        print "ok - Esjis::b _ == -b _\n";
    }
    else {
        print "not ok - Esjis::b _ == -b _\n";
    }
}
else {
    if (Esjis::b(_)) {
        print "not ok - Esjis::b _ == -b _\n";
    }
    else {
        print "ok - Esjis::b _ == -b _\n";
    }
}

if (-c ('file')) {
    if (Esjis::c(_)) {
        print "ok - Esjis::c _ == -c _\n";
    }
    else {
        print "not ok - Esjis::c _ == -c _\n";
    }
}
else {
    if (Esjis::c(_)) {
        print "not ok - Esjis::c _ == -c _\n";
    }
    else {
        print "ok - Esjis::c _ == -c _\n";
    }
}

if (-t ('file')) {
    if (Esjis::t(_)) {
        print "ok - Esjis::t _ == -t _\n";
    }
    else {
        print "not ok - Esjis::t _ == -t _\n";
    }
}
else {
    if (Esjis::t(_)) {
        print "not ok - Esjis::t _ == -t _\n";
    }
    else {
        print "ok - Esjis::t _ == -t _\n";
    }
}

if (-u ('file')) {
    if (Esjis::u(_)) {
        print "ok - Esjis::u _ == -u _\n";
    }
    else {
        print "not ok - Esjis::u _ == -u _\n";
    }
}
else {
    if (Esjis::u(_)) {
        print "not ok - Esjis::u _ == -u _\n";
    }
    else {
        print "ok - Esjis::u _ == -u _\n";
    }
}

if (-g ('file')) {
    if (Esjis::g(_)) {
        print "ok - Esjis::g _ == -g _\n";
    }
    else {
        print "not ok - Esjis::g _ == -g _\n";
    }
}
else {
    if (Esjis::g(_)) {
        print "not ok - Esjis::g _ == -g _\n";
    }
    else {
        print "ok - Esjis::g _ == -g _\n";
    }
}

if (-k ('file')) {
    if (Esjis::k(_)) {
        print "ok - Esjis::k _ == -k _\n";
    }
    else {
        print "not ok - Esjis::k _ == -k _\n";
    }
}
else {
    if (Esjis::k(_)) {
        print "not ok - Esjis::k _ == -k _\n";
    }
    else {
        print "ok - Esjis::k _ == -k _\n";
    }
}

$_ = -M 'file';
if (Esjis::M(_) == $_) {
    print "ok - Esjis::M _ (@{[Esjis::M _]}) == -M 'file' ($_)\n";
}
else {
    print "not ok - Esjis::M _ (@{[Esjis::M _]}) == -M 'file' ($_)\n";
}
$_ = -A 'file';
if (Esjis::A(_) == $_) {
    print "ok - Esjis::A _ (@{[Esjis::A _]}) == -A 'file' ($_)\n";
}
else {
    print "not ok - Esjis::A _ (@{[Esjis::A _]}) == -A 'file' ($_)\n";
}
$_ = -C 'file';
if (Esjis::C(_) == $_) {
    print "ok - Esjis::C _ (@{[Esjis::C _]}) == -C 'file' ($_)\n";
}
else {
    print "not ok - Esjis::C _ (@{[Esjis::C _]}) == -C 'file' ($_)\n";
}
__END__
