# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# ��ʓI�ȃt�@�C������ chr(0x5C) �ŏI���t�@�C�����̃t�@�C���e�X�g�̌��ʂ���v���邱�Ƃ̊m�F

use Sjis;

open(FILE,'>file');
close(FILE);
open(FILE,'>F�@�\');
close(FILE);

open(FILE1,'file');
open(FILE2,'F�@�\');

if (((-r 'file') ne '') == ((-r 'F�@�\') ne '')) {
    print "ok - -r 'file' == -r 'F�@�\'\n";
}
else {
    print "not ok - -r 'file' == -r 'F�@�\'\n";
}

if (((-r FILE1) ne '') == ((-r FILE2) ne '')) {
    print "ok - -r FILE1 == -r FILE2\n";
}
else {
    print "not ok - -r FILE1 == -r FILE2\n";
}

if (((-w 'file') ne '') == ((-w 'F�@�\') ne '')) {
    print "ok - -w 'file' == -w 'F�@�\'\n";
}
else {
    print "not ok - -w 'file' == -w 'F�@�\'\n";
}

if (((-w FILE1) ne '') == ((-w FILE2) ne '')) {
    print "ok - -w FILE1 == -w FILE2\n";
}
else {
    print "not ok - -w FILE1 == -w FILE2\n";
}

if (((-x 'file') ne '') == ((-x 'F�@�\') ne '')) {
    print "ok - -x 'file' == -x 'F�@�\'\n";
}
else {
    print "not ok - -x 'file' == -x 'F�@�\'\n";
}

if (((-x FILE1) ne '') == ((-x FILE2) ne '')) {
    print "ok - -x FILE1 == -x FILE2\n";
}
else {
    print "not ok - -x FILE1 == -x FILE2\n";
}

if (((-o 'file') ne '') == ((-o 'F�@�\') ne '')) {
    print "ok - -o 'file' == -o 'F�@�\'\n";
}
else {
    print "not ok - -o 'file' == -o 'F�@�\'\n";
}

if (((-o FILE1) ne '') == ((-o FILE2) ne '')) {
    print "ok - -o FILE1 == -o FILE2\n";
}
else {
    print "not ok - -o FILE1 == -o FILE2\n";
}

if (((-R 'file') ne '') == ((-R 'F�@�\') ne '')) {
    print "ok - -R 'file' == -R 'F�@�\'\n";
}
else {
    print "not ok - -R 'file' == -R 'F�@�\'\n";
}

if (((-R FILE1) ne '') == ((-R FILE2) ne '')) {
    print "ok - -R FILE1 == -R FILE2\n";
}
else {
    print "not ok - -R FILE1 == -R FILE2\n";
}

if (((-W 'file') ne '') == ((-W 'F�@�\') ne '')) {
    print "ok - -W 'file' == -W 'F�@�\'\n";
}
else {
    print "not ok - -W 'file' == -W 'F�@�\'\n";
}

if (((-W FILE1) ne '') == ((-W FILE2) ne '')) {
    print "ok - -W FILE1 == -W FILE2\n";
}
else {
    print "not ok - -W FILE1 == -W FILE2\n";
}

if (((-X 'file') ne '') == ((-X 'F�@�\') ne '')) {
    print "ok - -X 'file' == -X 'F�@�\'\n";
}
else {
    print "not ok - -X 'file' == -X 'F�@�\'\n";
}

if (((-X FILE1) ne '') == ((-X FILE2) ne '')) {
    print "ok - -X FILE1 == -X FILE2\n";
}
else {
    print "not ok - -X FILE1 == -X FILE2\n";
}

if (((-O 'file') ne '') == ((-O 'F�@�\') ne '')) {
    print "ok - -O 'file' == -O 'F�@�\'\n";
}
else {
    print "not ok - -O 'file' == -O 'F�@�\'\n";
}

if (((-O FILE1) ne '') == ((-O FILE2) ne '')) {
    print "ok - -O FILE1 == -O FILE2\n";
}
else {
    print "not ok - -O FILE1 == -O FILE2\n";
}

if (((-e 'file') ne '') == ((-e 'F�@�\') ne '')) {
    print "ok - -e 'file' == -e 'F�@�\'\n";
}
else {
    print "not ok - -e 'file' == -e 'F�@�\'\n";
}

if (((-e FILE1) ne '') == ((-e FILE2) ne '')) {
    print "ok - -e FILE1 == -e FILE2\n";
}
else {
    print "not ok - -e FILE1 == -e FILE2\n";
}

if (((-z 'file') ne '') == ((-z 'F�@�\') ne '')) {
    print "ok - -z 'file' == -z 'F�@�\'\n";
}
else {
    print "not ok - -z 'file' == -z 'F�@�\'\n";
}

if (((-z FILE1) ne '') == ((-z FILE2) ne '')) {
    print "ok - -z FILE1 == -z FILE2\n";
}
else {
    print "not ok - -z FILE1 == -z FILE2\n";
}

if (((-s 'file') ne '') == ((-s 'F�@�\') ne '')) {
    print "ok - -s 'file' == -s 'F�@�\'\n";
}
else {
    print "not ok - -s 'file' == -s 'F�@�\'\n";
}

if (((-s FILE1) ne '') == ((-s FILE2) ne '')) {
    print "ok - -s FILE1 == -s FILE2\n";
}
else {
    print "not ok - -s FILE1 == -s FILE2\n";
}

if (((-f 'file') ne '') == ((-f 'F�@�\') ne '')) {
    print "ok - -f 'file' == -f 'F�@�\'\n";
}
else {
    print "not ok - -f 'file' == -f 'F�@�\'\n";
}

if (((-f FILE1) ne '') == ((-f FILE2) ne '')) {
    print "ok - -f FILE1 == -f FILE2\n";
}
else {
    print "not ok - -f FILE1 == -f FILE2\n";
}

if (((-d 'file') ne '') == ((-d 'F�@�\') ne '')) {
    print "ok - -d 'file' == -d 'F�@�\'\n";
}
else {
    print "not ok - -d 'file' == -d 'F�@�\'\n";
}

if (((-d FILE1) ne '') == ((-d FILE2) ne '')) {
    print "ok - -d FILE1 == -d FILE2\n";
}
else {
    print "not ok - -d FILE1 == -d FILE2\n";
}

if (((-p 'file') ne '') == ((-p 'F�@�\') ne '')) {
    print "ok - -p 'file' == -p 'F�@�\'\n";
}
else {
    print "not ok - -p 'file' == -p 'F�@�\'\n";
}

if (((-p FILE1) ne '') == ((-p FILE2) ne '')) {
    print "ok - -p FILE1 == -p FILE2\n";
}
else {
    print "not ok - -p FILE1 == -p FILE2\n";
}

if (((-S 'file') ne '') == ((-S 'F�@�\') ne '')) {
    print "ok - -S 'file' == -S 'F�@�\'\n";
}
else {
    print "not ok - -S 'file' == -S 'F�@�\'\n";
}

if (((-S FILE1) ne '') == ((-S FILE2) ne '')) {
    print "ok - -S FILE1 == -S FILE2\n";
}
else {
    print "not ok - -S FILE1 == -S FILE2\n";
}

if (((-b 'file') ne '') == ((-b 'F�@�\') ne '')) {
    print "ok - -b 'file' == -b 'F�@�\'\n";
}
else {
    print "not ok - -b 'file' == -b 'F�@�\'\n";
}

if (((-b FILE1) ne '') == ((-b FILE2) ne '')) {
    print "ok - -b FILE1 == -b FILE2\n";
}
else {
    print "not ok - -b FILE1 == -b FILE2\n";
}

if (((-c 'file') ne '') == ((-c 'F�@�\') ne '')) {
    print "ok - -c 'file' == -c 'F�@�\'\n";
}
else {
    print "not ok - -c 'file' == -c 'F�@�\'\n";
}

if (((-c FILE1) ne '') == ((-c FILE2) ne '')) {
    print "ok - -c FILE1 == -c FILE2\n";
}
else {
    print "not ok - -c FILE1 == -c FILE2\n";
}

if (((-t 'file') ne '') == ((-t 'F�@�\') ne '')) {
    print "ok - -t 'file' == -t 'F�@�\'\n";
}
else {
    print "not ok - -t 'file' == -t 'F�@�\'\n";
}

if (((-t FILE1) ne '') == ((-t FILE2) ne '')) {
    print "ok - -t FILE1 == -t FILE2\n";
}
else {
    print "not ok - -t FILE1 == -t FILE2\n";
}

if (((-u 'file') ne '') == ((-u 'F�@�\') ne '')) {
    print "ok - -u 'file' == -u 'F�@�\'\n";
}
else {
    print "not ok - -u 'file' == -u 'F�@�\'\n";
}

if (((-u FILE1) ne '') == ((-u FILE2) ne '')) {
    print "ok - -u FILE1 == -u FILE2\n";
}
else {
    print "not ok - -u FILE1 == -u FILE2\n";
}

if (((-g 'file') ne '') == ((-g 'F�@�\') ne '')) {
    print "ok - -g 'file' == -g 'F�@�\'\n";
}
else {
    print "not ok - -g 'file' == -g 'F�@�\'\n";
}

if (((-g FILE1) ne '') == ((-g FILE2) ne '')) {
    print "ok - -g FILE1 == -g FILE2\n";
}
else {
    print "not ok - -g FILE1 == -g FILE2\n";
}

if (((-k 'file') ne '') == ((-k 'F�@�\') ne '')) {
    print "ok - -k 'file' == -k 'F�@�\'\n";
}
else {
    print "not ok - -k 'file' == -k 'F�@�\'\n";
}

if (((-k FILE1) ne '') == ((-k FILE2) ne '')) {
    print "ok - -k FILE1 == -k FILE2\n";
}
else {
    print "not ok - -k FILE1 == -k FILE2\n";
}

if (((-T 'file') ne '') == ((-T 'F�@�\') ne '')) {
    print "ok - -T 'file' == -T 'F�@�\'\n";
}
else {
    print "not ok - -T 'file' == -T 'F�@�\'\n";
}

if (((-T FILE1) ne '') == ((-T FILE2) ne '')) {
    print "ok - -T FILE1 == -T FILE2\n";
}
else {
    print "not ok - -T FILE1 == -T FILE2\n";
}

if (((-B 'file') ne '') == ((-B 'F�@�\') ne '')) {
    print "ok - -B 'file' == -B 'F�@�\'\n";
}
else {
    print "not ok - -B 'file' == -B 'F�@�\'\n";
}

if (((-B FILE1) ne '') == ((-B FILE2) ne '')) {
    print "ok - -B FILE1 == -B FILE2\n";
}
else {
    print "not ok - -B FILE1 == -B FILE2\n";
}

if (((-M 'file') ne '') == ((-M 'F�@�\') ne '')) {
    print "ok - -M 'file' == -M 'F�@�\'\n";
}
else {
    print "not ok - -M 'file' == -M 'F�@�\'\n";
}

if (((-M FILE1) ne '') == ((-M FILE2) ne '')) {
    print "ok - -M FILE1 == -M FILE2\n";
}
else {
    print "not ok - -M FILE1 == -M FILE2\n";
}

if (((-A 'file') ne '') == ((-A 'F�@�\') ne '')) {
    print "ok - -A 'file' == -A 'F�@�\'\n";
}
else {
    print "not ok - -A 'file' == -A 'F�@�\'\n";
}

if (((-A FILE1) ne '') == ((-A FILE2) ne '')) {
    print "ok - -A FILE1 == -A FILE2\n";
}
else {
    print "not ok - -A FILE1 == -A FILE2\n";
}

if (((-C 'file') ne '') == ((-C 'F�@�\') ne '')) {
    print "ok - -C 'file' == -C 'F�@�\'\n";
}
else {
    print "not ok - -C 'file' == -C 'F�@�\'\n";
}

if (((-C FILE1) ne '') == ((-C FILE2) ne '')) {
    print "ok - -C FILE1 == -C FILE2\n";
}
else {
    print "not ok - -C FILE1 == -C FILE2\n";
}

__END__
