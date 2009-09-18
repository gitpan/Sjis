# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

# 一般的なディレクトリル名と chr(0x5C) で終わるディレクトリ名のファイルテストの結果が一致することの確認

use Sjis;

mkdir('directory',0777);
mkdir('D機能',0777);

opendir(DIR1,'directory');
opendir(DIR2,'D機能');

if (((-r 'directory') ne '') == ((-r 'D機能') ne '')) {
    print "ok - -r 'directory' == -r 'D機能'\n";
}
else {
    print "not ok - -r 'directory' == -r 'D機能'\n";
}

if (((-r DIR1) ne '') == ((-r DIR2) ne '')) {
    print "ok - -r DIR1 == -r DIR2\n";
}
else {
    print "not ok - -r DIR1 == -r DIR2\n";
}

if (((-w 'directory') ne '') == ((-w 'D機能') ne '')) {
    print "ok - -w 'directory' == -w 'D機能'\n";
}
else {
    print "not ok - -w 'directory' == -w 'D機能'\n";
}

if (((-w DIR1) ne '') == ((-w DIR2) ne '')) {
    print "ok - -w DIR1 == -w DIR2\n";
}
else {
    print "not ok - -w DIR1 == -w DIR2\n";
}

if (((-x 'directory') ne '') == ((-x 'D機能') ne '')) {
    print "ok - -x 'directory' == -x 'D機能'\n";
}
else {
    print "not ok - -x 'directory' == -x 'D機能'\n";
}

if (((-x DIR1) ne '') == ((-x DIR2) ne '')) {
    print "ok - -x DIR1 == -x DIR2\n";
}
else {
    print "not ok - -x DIR1 == -x DIR2\n";
}

if (((-o 'directory') ne '') == ((-o 'D機能') ne '')) {
    print "ok - -o 'directory' == -o 'D機能'\n";
}
else {
    print "not ok - -o 'directory' == -o 'D機能'\n";
}

if (((-o DIR1) ne '') == ((-o DIR2) ne '')) {
    print "ok - -o DIR1 == -o DIR2\n";
}
else {
    print "not ok - -o DIR1 == -o DIR2\n";
}

if (((-R 'directory') ne '') == ((-R 'D機能') ne '')) {
    print "ok - -R 'directory' == -R 'D機能'\n";
}
else {
    print "not ok - -R 'directory' == -R 'D機能'\n";
}

if (((-R DIR1) ne '') == ((-R DIR2) ne '')) {
    print "ok - -R DIR1 == -R DIR2\n";
}
else {
    print "not ok - -R DIR1 == -R DIR2\n";
}

if (((-W 'directory') ne '') == ((-W 'D機能') ne '')) {
    print "ok - -W 'directory' == -W 'D機能'\n";
}
else {
    print "not ok - -W 'directory' == -W 'D機能'\n";
}

if (((-W DIR1) ne '') == ((-W DIR2) ne '')) {
    print "ok - -W DIR1 == -W DIR2\n";
}
else {
    print "not ok - -W DIR1 == -W DIR2\n";
}

if (((-X 'directory') ne '') == ((-X 'D機能') ne '')) {
    print "ok - -X 'directory' == -X 'D機能'\n";
}
else {
    print "not ok - -X 'directory' == -X 'D機能'\n";
}

if (((-X DIR1) ne '') == ((-X DIR2) ne '')) {
    print "ok - -X DIR1 == -X DIR2\n";
}
else {
    print "not ok - -X DIR1 == -X DIR2\n";
}

if (((-O 'directory') ne '') == ((-O 'D機能') ne '')) {
    print "ok - -O 'directory' == -O 'D機能'\n";
}
else {
    print "not ok - -O 'directory' == -O 'D機能'\n";
}

if (((-O DIR1) ne '') == ((-O DIR2) ne '')) {
    print "ok - -O DIR1 == -O DIR2\n";
}
else {
    print "not ok - -O DIR1 == -O DIR2\n";
}

if (((-e 'directory') ne '') == ((-e 'D機能') ne '')) {
    print "ok - -e 'directory' == -e 'D機能'\n";
}
else {
    print "not ok - -e 'directory' == -e 'D機能'\n";
}

if (((-e DIR1) ne '') == ((-e DIR2) ne '')) {
    print "ok - -e DIR1 == -e DIR2\n";
}
else {
    print "not ok - -e DIR1 == -e DIR2\n";
}

if (((-z 'directory') ne '') == ((-z 'D機能') ne '')) {
    print "ok - -z 'directory' == -z 'D機能'\n";
}
else {
    print "not ok - -z 'directory' == -z 'D機能'\n";
}

if (((-z DIR1) ne '') == ((-z DIR2) ne '')) {
    print "ok - -z DIR1 == -z DIR2\n";
}
else {
    print "not ok - -z DIR1 == -z DIR2\n";
}

if (((-s 'directory') ne '') == ((-s 'D機能') ne '')) {
    print "ok - -s 'directory' == -s 'D機能'\n";
}
else {
    print "not ok - -s 'directory' == -s 'D機能'\n";
}

if (((-s DIR1) ne '') == ((-s DIR2) ne '')) {
    print "ok - -s DIR1 == -s DIR2\n";
}
else {
    print "not ok - -s DIR1 == -s DIR2\n";
}

if (((-f 'directory') ne '') == ((-f 'D機能') ne '')) {
    print "ok - -f 'directory' == -f 'D機能'\n";
}
else {
    print "not ok - -f 'directory' == -f 'D機能'\n";
}

if (((-f DIR1) ne '') == ((-f DIR2) ne '')) {
    print "ok - -f DIR1 == -f DIR2\n";
}
else {
    print "not ok - -f DIR1 == -f DIR2\n";
}

if (((-d 'directory') ne '') == ((-d 'D機能') ne '')) {
    print "ok - -d 'directory' == -d 'D機能'\n";
}
else {
    print "not ok - -d 'directory' == -d 'D機能'\n";
}

if (((-d DIR1) ne '') == ((-d DIR2) ne '')) {
    print "ok - -d DIR1 == -d DIR2\n";
}
else {
    print "not ok - -d DIR1 == -d DIR2\n";
}

if (((-p 'directory') ne '') == ((-p 'D機能') ne '')) {
    print "ok - -p 'directory' == -p 'D機能'\n";
}
else {
    print "not ok - -p 'directory' == -p 'D機能'\n";
}

if (((-p DIR1) ne '') == ((-p DIR2) ne '')) {
    print "ok - -p DIR1 == -p DIR2\n";
}
else {
    print "not ok - -p DIR1 == -p DIR2\n";
}

if (((-S 'directory') ne '') == ((-S 'D機能') ne '')) {
    print "ok - -S 'directory' == -S 'D機能'\n";
}
else {
    print "not ok - -S 'directory' == -S 'D機能'\n";
}

if (((-S DIR1) ne '') == ((-S DIR2) ne '')) {
    print "ok - -S DIR1 == -S DIR2\n";
}
else {
    print "not ok - -S DIR1 == -S DIR2\n";
}

if (((-b 'directory') ne '') == ((-b 'D機能') ne '')) {
    print "ok - -b 'directory' == -b 'D機能'\n";
}
else {
    print "not ok - -b 'directory' == -b 'D機能'\n";
}

if (((-b DIR1) ne '') == ((-b DIR2) ne '')) {
    print "ok - -b DIR1 == -b DIR2\n";
}
else {
    print "not ok - -b DIR1 == -b DIR2\n";
}

if (((-c 'directory') ne '') == ((-c 'D機能') ne '')) {
    print "ok - -c 'directory' == -c 'D機能'\n";
}
else {
    print "not ok - -c 'directory' == -c 'D機能'\n";
}

if (((-c DIR1) ne '') == ((-c DIR2) ne '')) {
    print "ok - -c DIR1 == -c DIR2\n";
}
else {
    print "not ok - -c DIR1 == -c DIR2\n";
}

if (((-t 'directory') ne '') == ((-t 'D機能') ne '')) {
    print "ok - -t 'directory' == -t 'D機能'\n";
}
else {
    print "not ok - -t 'directory' == -t 'D機能'\n";
}

if (((-t DIR1) ne '') == ((-t DIR2) ne '')) {
    print "ok - -t DIR1 == -t DIR2\n";
}
else {
    print "not ok - -t DIR1 == -t DIR2\n";
}

if (((-u 'directory') ne '') == ((-u 'D機能') ne '')) {
    print "ok - -u 'directory' == -u 'D機能'\n";
}
else {
    print "not ok - -u 'directory' == -u 'D機能'\n";
}

if (((-u DIR1) ne '') == ((-u DIR2) ne '')) {
    print "ok - -u DIR1 == -u DIR2\n";
}
else {
    print "not ok - -u DIR1 == -u DIR2\n";
}

if (((-g 'directory') ne '') == ((-g 'D機能') ne '')) {
    print "ok - -g 'directory' == -g 'D機能'\n";
}
else {
    print "not ok - -g 'directory' == -g 'D機能'\n";
}

if (((-g DIR1) ne '') == ((-g DIR2) ne '')) {
    print "ok - -g DIR1 == -g DIR2\n";
}
else {
    print "not ok - -g DIR1 == -g DIR2\n";
}

if (((-k 'directory') ne '') == ((-k 'D機能') ne '')) {
    print "ok - -k 'directory' == -k 'D機能'\n";
}
else {
    print "not ok - -k 'directory' == -k 'D機能'\n";
}

if (((-k DIR1) ne '') == ((-k DIR2) ne '')) {
    print "ok - -k DIR1 == -k DIR2\n";
}
else {
    print "not ok - -k DIR1 == -k DIR2\n";
}

if (((-T 'directory') ne '') == ((-T 'D機能') ne '')) {
    print "ok - -T 'directory' == -T 'D機能'\n";
}
else {
    print "not ok - -T 'directory' == -T 'D機能'\n";
}

if (((-T DIR1) ne '') == ((-T DIR2) ne '')) {
    print "ok - -T DIR1 == -T DIR2\n";
}
else {
    print "not ok - -T DIR1 == -T DIR2\n";
}

if (((-B 'directory') ne '') == ((-B 'D機能') ne '')) {
    print "ok - -B 'directory' == -B 'D機能'\n";
}
else {
    print "not ok - -B 'directory' == -B 'D機能'\n";
}

if (((-B DIR1) ne '') == ((-B DIR2) ne '')) {
    print "ok - -B DIR1 == -B DIR2\n";
}
else {
    print "not ok - -B DIR1 == -B DIR2\n";
}

if (((-M 'directory') ne '') == ((-M 'D機能') ne '')) {
    print "ok - -M 'directory' == -M 'D機能'\n";
}
else {
    print "not ok - -M 'directory' == -M 'D機能'\n";
}

if (((-M DIR1) ne '') == ((-M DIR2) ne '')) {
    print "ok - -M DIR1 == -M DIR2\n";
}
else {
    print "not ok - -M DIR1 == -M DIR2\n";
}

if (((-A 'directory') ne '') == ((-A 'D機能') ne '')) {
    print "ok - -A 'directory' == -A 'D機能'\n";
}
else {
    print "not ok - -A 'directory' == -A 'D機能'\n";
}

if (((-A DIR1) ne '') == ((-A DIR2) ne '')) {
    print "ok - -A DIR1 == -A DIR2\n";
}
else {
    print "not ok - -A DIR1 == -A DIR2\n";
}

if (((-C 'directory') ne '') == ((-C 'D機能') ne '')) {
    print "ok - -C 'directory' == -C 'D機能'\n";
}
else {
    print "not ok - -C 'directory' == -C 'D機能'\n";
}

if (((-C DIR1) ne '') == ((-C DIR2) ne '')) {
    print "ok - -C DIR1 == -C DIR2\n";
}
else {
    print "not ok - -C DIR1 == -C DIR2\n";
}

__END__
