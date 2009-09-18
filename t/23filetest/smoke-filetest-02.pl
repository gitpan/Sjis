# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 一般的なファイル名と chr(0x5C) で終わるファイル名のファイルテストの結果が一致することの確認

use Sjis;

open(FILE,'>file');
close(FILE);
open(FILE,'>F機能');
close(FILE);

open(FILE1,'file');
open(FILE2,'F機能');

if (((-r 'file') ne '') == ((-r 'F機能') ne '')) {
    print "ok - -r 'file' == -r 'F機能'\n";
}
else {
    print "not ok - -r 'file' == -r 'F機能'\n";
}

if (((-r FILE1) ne '') == ((-r FILE2) ne '')) {
    print "ok - -r FILE1 == -r FILE2\n";
}
else {
    print "not ok - -r FILE1 == -r FILE2\n";
}

if (((-w 'file') ne '') == ((-w 'F機能') ne '')) {
    print "ok - -w 'file' == -w 'F機能'\n";
}
else {
    print "not ok - -w 'file' == -w 'F機能'\n";
}

if (((-w FILE1) ne '') == ((-w FILE2) ne '')) {
    print "ok - -w FILE1 == -w FILE2\n";
}
else {
    print "not ok - -w FILE1 == -w FILE2\n";
}

if (((-x 'file') ne '') == ((-x 'F機能') ne '')) {
    print "ok - -x 'file' == -x 'F機能'\n";
}
else {
    print "not ok - -x 'file' == -x 'F機能'\n";
}

if (((-x FILE1) ne '') == ((-x FILE2) ne '')) {
    print "ok - -x FILE1 == -x FILE2\n";
}
else {
    print "not ok - -x FILE1 == -x FILE2\n";
}

if (((-o 'file') ne '') == ((-o 'F機能') ne '')) {
    print "ok - -o 'file' == -o 'F機能'\n";
}
else {
    print "not ok - -o 'file' == -o 'F機能'\n";
}

if (((-o FILE1) ne '') == ((-o FILE2) ne '')) {
    print "ok - -o FILE1 == -o FILE2\n";
}
else {
    print "not ok - -o FILE1 == -o FILE2\n";
}

if (((-R 'file') ne '') == ((-R 'F機能') ne '')) {
    print "ok - -R 'file' == -R 'F機能'\n";
}
else {
    print "not ok - -R 'file' == -R 'F機能'\n";
}

if (((-R FILE1) ne '') == ((-R FILE2) ne '')) {
    print "ok - -R FILE1 == -R FILE2\n";
}
else {
    print "not ok - -R FILE1 == -R FILE2\n";
}

if (((-W 'file') ne '') == ((-W 'F機能') ne '')) {
    print "ok - -W 'file' == -W 'F機能'\n";
}
else {
    print "not ok - -W 'file' == -W 'F機能'\n";
}

if (((-W FILE1) ne '') == ((-W FILE2) ne '')) {
    print "ok - -W FILE1 == -W FILE2\n";
}
else {
    print "not ok - -W FILE1 == -W FILE2\n";
}

if (((-X 'file') ne '') == ((-X 'F機能') ne '')) {
    print "ok - -X 'file' == -X 'F機能'\n";
}
else {
    print "not ok - -X 'file' == -X 'F機能'\n";
}

if (((-X FILE1) ne '') == ((-X FILE2) ne '')) {
    print "ok - -X FILE1 == -X FILE2\n";
}
else {
    print "not ok - -X FILE1 == -X FILE2\n";
}

if (((-O 'file') ne '') == ((-O 'F機能') ne '')) {
    print "ok - -O 'file' == -O 'F機能'\n";
}
else {
    print "not ok - -O 'file' == -O 'F機能'\n";
}

if (((-O FILE1) ne '') == ((-O FILE2) ne '')) {
    print "ok - -O FILE1 == -O FILE2\n";
}
else {
    print "not ok - -O FILE1 == -O FILE2\n";
}

if (((-e 'file') ne '') == ((-e 'F機能') ne '')) {
    print "ok - -e 'file' == -e 'F機能'\n";
}
else {
    print "not ok - -e 'file' == -e 'F機能'\n";
}

if (((-e FILE1) ne '') == ((-e FILE2) ne '')) {
    print "ok - -e FILE1 == -e FILE2\n";
}
else {
    print "not ok - -e FILE1 == -e FILE2\n";
}

if (((-z 'file') ne '') == ((-z 'F機能') ne '')) {
    print "ok - -z 'file' == -z 'F機能'\n";
}
else {
    print "not ok - -z 'file' == -z 'F機能'\n";
}

if (((-z FILE1) ne '') == ((-z FILE2) ne '')) {
    print "ok - -z FILE1 == -z FILE2\n";
}
else {
    print "not ok - -z FILE1 == -z FILE2\n";
}

if (((-s 'file') ne '') == ((-s 'F機能') ne '')) {
    print "ok - -s 'file' == -s 'F機能'\n";
}
else {
    print "not ok - -s 'file' == -s 'F機能'\n";
}

if (((-s FILE1) ne '') == ((-s FILE2) ne '')) {
    print "ok - -s FILE1 == -s FILE2\n";
}
else {
    print "not ok - -s FILE1 == -s FILE2\n";
}

if (((-f 'file') ne '') == ((-f 'F機能') ne '')) {
    print "ok - -f 'file' == -f 'F機能'\n";
}
else {
    print "not ok - -f 'file' == -f 'F機能'\n";
}

if (((-f FILE1) ne '') == ((-f FILE2) ne '')) {
    print "ok - -f FILE1 == -f FILE2\n";
}
else {
    print "not ok - -f FILE1 == -f FILE2\n";
}

if (((-d 'file') ne '') == ((-d 'F機能') ne '')) {
    print "ok - -d 'file' == -d 'F機能'\n";
}
else {
    print "not ok - -d 'file' == -d 'F機能'\n";
}

if (((-d FILE1) ne '') == ((-d FILE2) ne '')) {
    print "ok - -d FILE1 == -d FILE2\n";
}
else {
    print "not ok - -d FILE1 == -d FILE2\n";
}

if (((-p 'file') ne '') == ((-p 'F機能') ne '')) {
    print "ok - -p 'file' == -p 'F機能'\n";
}
else {
    print "not ok - -p 'file' == -p 'F機能'\n";
}

if (((-p FILE1) ne '') == ((-p FILE2) ne '')) {
    print "ok - -p FILE1 == -p FILE2\n";
}
else {
    print "not ok - -p FILE1 == -p FILE2\n";
}

if (((-S 'file') ne '') == ((-S 'F機能') ne '')) {
    print "ok - -S 'file' == -S 'F機能'\n";
}
else {
    print "not ok - -S 'file' == -S 'F機能'\n";
}

if (((-S FILE1) ne '') == ((-S FILE2) ne '')) {
    print "ok - -S FILE1 == -S FILE2\n";
}
else {
    print "not ok - -S FILE1 == -S FILE2\n";
}

if (((-b 'file') ne '') == ((-b 'F機能') ne '')) {
    print "ok - -b 'file' == -b 'F機能'\n";
}
else {
    print "not ok - -b 'file' == -b 'F機能'\n";
}

if (((-b FILE1) ne '') == ((-b FILE2) ne '')) {
    print "ok - -b FILE1 == -b FILE2\n";
}
else {
    print "not ok - -b FILE1 == -b FILE2\n";
}

if (((-c 'file') ne '') == ((-c 'F機能') ne '')) {
    print "ok - -c 'file' == -c 'F機能'\n";
}
else {
    print "not ok - -c 'file' == -c 'F機能'\n";
}

if (((-c FILE1) ne '') == ((-c FILE2) ne '')) {
    print "ok - -c FILE1 == -c FILE2\n";
}
else {
    print "not ok - -c FILE1 == -c FILE2\n";
}

if (((-t 'file') ne '') == ((-t 'F機能') ne '')) {
    print "ok - -t 'file' == -t 'F機能'\n";
}
else {
    print "not ok - -t 'file' == -t 'F機能'\n";
}

if (((-t FILE1) ne '') == ((-t FILE2) ne '')) {
    print "ok - -t FILE1 == -t FILE2\n";
}
else {
    print "not ok - -t FILE1 == -t FILE2\n";
}

if (((-u 'file') ne '') == ((-u 'F機能') ne '')) {
    print "ok - -u 'file' == -u 'F機能'\n";
}
else {
    print "not ok - -u 'file' == -u 'F機能'\n";
}

if (((-u FILE1) ne '') == ((-u FILE2) ne '')) {
    print "ok - -u FILE1 == -u FILE2\n";
}
else {
    print "not ok - -u FILE1 == -u FILE2\n";
}

if (((-g 'file') ne '') == ((-g 'F機能') ne '')) {
    print "ok - -g 'file' == -g 'F機能'\n";
}
else {
    print "not ok - -g 'file' == -g 'F機能'\n";
}

if (((-g FILE1) ne '') == ((-g FILE2) ne '')) {
    print "ok - -g FILE1 == -g FILE2\n";
}
else {
    print "not ok - -g FILE1 == -g FILE2\n";
}

if (((-k 'file') ne '') == ((-k 'F機能') ne '')) {
    print "ok - -k 'file' == -k 'F機能'\n";
}
else {
    print "not ok - -k 'file' == -k 'F機能'\n";
}

if (((-k FILE1) ne '') == ((-k FILE2) ne '')) {
    print "ok - -k FILE1 == -k FILE2\n";
}
else {
    print "not ok - -k FILE1 == -k FILE2\n";
}

if (((-T 'file') ne '') == ((-T 'F機能') ne '')) {
    print "ok - -T 'file' == -T 'F機能'\n";
}
else {
    print "not ok - -T 'file' == -T 'F機能'\n";
}

if (((-T FILE1) ne '') == ((-T FILE2) ne '')) {
    print "ok - -T FILE1 == -T FILE2\n";
}
else {
    print "not ok - -T FILE1 == -T FILE2\n";
}

if (((-B 'file') ne '') == ((-B 'F機能') ne '')) {
    print "ok - -B 'file' == -B 'F機能'\n";
}
else {
    print "not ok - -B 'file' == -B 'F機能'\n";
}

if (((-B FILE1) ne '') == ((-B FILE2) ne '')) {
    print "ok - -B FILE1 == -B FILE2\n";
}
else {
    print "not ok - -B FILE1 == -B FILE2\n";
}

if (((-M 'file') ne '') == ((-M 'F機能') ne '')) {
    print "ok - -M 'file' == -M 'F機能'\n";
}
else {
    print "not ok - -M 'file' == -M 'F機能'\n";
}

if (((-M FILE1) ne '') == ((-M FILE2) ne '')) {
    print "ok - -M FILE1 == -M FILE2\n";
}
else {
    print "not ok - -M FILE1 == -M FILE2\n";
}

if (((-A 'file') ne '') == ((-A 'F機能') ne '')) {
    print "ok - -A 'file' == -A 'F機能'\n";
}
else {
    print "not ok - -A 'file' == -A 'F機能'\n";
}

if (((-A FILE1) ne '') == ((-A FILE2) ne '')) {
    print "ok - -A FILE1 == -A FILE2\n";
}
else {
    print "not ok - -A FILE1 == -A FILE2\n";
}

if (((-C 'file') ne '') == ((-C 'F機能') ne '')) {
    print "ok - -C 'file' == -C 'F機能'\n";
}
else {
    print "not ok - -C 'file' == -C 'F機能'\n";
}

if (((-C FILE1) ne '') == ((-C FILE2) ne '')) {
    print "ok - -C FILE1 == -C FILE2\n";
}
else {
    print "not ok - -C FILE1 == -C FILE2\n";
}

__END__
