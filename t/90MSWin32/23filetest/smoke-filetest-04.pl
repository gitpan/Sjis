# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

# ��ʓI�ȃf�B���N�g�������� chr(0x5C) �ŏI���f�B���N�g�����̃t�@�C���e�X�g�̌��ʂ���v���邱�Ƃ̊m�F

my $__FILE__ = __FILE__;

use Sjis;

mkdir('directory',0777);
mkdir('D�@�\',0777);

opendir(DIR1,'directory');
opendir(DIR2,'D�@�\');

if (((-r 'directory') ne '') == ((-r 'D�@�\') ne '')) {
    print "ok - -r 'directory' == -r 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -r 'directory' == -r 'D�@�\' $^X $__FILE__\n";
}

if (((-r DIR1) ne '') == ((-r DIR2) ne '')) {
    print "ok - -r DIR1 == -r DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -r DIR1 == -r DIR2 $^X $__FILE__\n";
}

if (((-w 'directory') ne '') == ((-w 'D�@�\') ne '')) {
    print "ok - -w 'directory' == -w 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -w 'directory' == -w 'D�@�\' $^X $__FILE__\n";
}

if (((-w DIR1) ne '') == ((-w DIR2) ne '')) {
    print "ok - -w DIR1 == -w DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -w DIR1 == -w DIR2 $^X $__FILE__\n";
}

if (((-x 'directory') ne '') == ((-x 'D�@�\') ne '')) {
    print "ok - -x 'directory' == -x 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -x 'directory' == -x 'D�@�\' $^X $__FILE__\n";
}

if (((-x DIR1) ne '') == ((-x DIR2) ne '')) {
    print "ok - -x DIR1 == -x DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -x DIR1 == -x DIR2 $^X $__FILE__\n";
}

if (((-o 'directory') ne '') == ((-o 'D�@�\') ne '')) {
    print "ok - -o 'directory' == -o 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -o 'directory' == -o 'D�@�\' $^X $__FILE__\n";
}

if (((-o DIR1) ne '') == ((-o DIR2) ne '')) {
    print "ok - -o DIR1 == -o DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -o DIR1 == -o DIR2 $^X $__FILE__\n";
}

if (((-R 'directory') ne '') == ((-R 'D�@�\') ne '')) {
    print "ok - -R 'directory' == -R 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -R 'directory' == -R 'D�@�\' $^X $__FILE__\n";
}

if (((-R DIR1) ne '') == ((-R DIR2) ne '')) {
    print "ok - -R DIR1 == -R DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -R DIR1 == -R DIR2 $^X $__FILE__\n";
}

if (((-W 'directory') ne '') == ((-W 'D�@�\') ne '')) {
    print "ok - -W 'directory' == -W 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -W 'directory' == -W 'D�@�\' $^X $__FILE__\n";
}

if (((-W DIR1) ne '') == ((-W DIR2) ne '')) {
    print "ok - -W DIR1 == -W DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -W DIR1 == -W DIR2 $^X $__FILE__\n";
}

if (((-X 'directory') ne '') == ((-X 'D�@�\') ne '')) {
    print "ok - -X 'directory' == -X 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -X 'directory' == -X 'D�@�\' $^X $__FILE__\n";
}

if (((-X DIR1) ne '') == ((-X DIR2) ne '')) {
    print "ok - -X DIR1 == -X DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -X DIR1 == -X DIR2 $^X $__FILE__\n";
}

if (((-O 'directory') ne '') == ((-O 'D�@�\') ne '')) {
    print "ok - -O 'directory' == -O 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -O 'directory' == -O 'D�@�\' $^X $__FILE__\n";
}

if (((-O DIR1) ne '') == ((-O DIR2) ne '')) {
    print "ok - -O DIR1 == -O DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -O DIR1 == -O DIR2 $^X $__FILE__\n";
}

if (((-e 'directory') ne '') == ((-e 'D�@�\') ne '')) {
    print "ok - -e 'directory' == -e 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -e 'directory' == -e 'D�@�\' $^X $__FILE__\n";
}

if (((-e DIR1) ne '') == ((-e DIR2) ne '')) {
    print "ok - -e DIR1 == -e DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -e DIR1 == -e DIR2 $^X $__FILE__\n";
}

if (((-z 'directory') ne '') == ((-z 'D�@�\') ne '')) {
    print "ok - -z 'directory' == -z 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -z 'directory' == -z 'D�@�\' $^X $__FILE__\n";
}

if (((-z DIR1) ne '') == ((-z DIR2) ne '')) {
    print "ok - -z DIR1 == -z DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -z DIR1 == -z DIR2 $^X $__FILE__\n";
}

if (((-s 'directory') ne '') == ((-s 'D�@�\') ne '')) {
    print "ok - -s 'directory' == -s 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -s 'directory' == -s 'D�@�\' $^X $__FILE__\n";
}

if (((-s DIR1) ne '') == ((-s DIR2) ne '')) {
    print "ok - -s DIR1 == -s DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -s DIR1 == -s DIR2 $^X $__FILE__\n";
}

if (((-f 'directory') ne '') == ((-f 'D�@�\') ne '')) {
    print "ok - -f 'directory' == -f 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -f 'directory' == -f 'D�@�\' $^X $__FILE__\n";
}

if (((-f DIR1) ne '') == ((-f DIR2) ne '')) {
    print "ok - -f DIR1 == -f DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -f DIR1 == -f DIR2 $^X $__FILE__\n";
}

if (((-d 'directory') ne '') == ((-d 'D�@�\') ne '')) {
    print "ok - -d 'directory' == -d 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -d 'directory' == -d 'D�@�\' $^X $__FILE__\n";
}

if (((-d DIR1) ne '') == ((-d DIR2) ne '')) {
    print "ok - -d DIR1 == -d DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -d DIR1 == -d DIR2 $^X $__FILE__\n";
}

if (((-p 'directory') ne '') == ((-p 'D�@�\') ne '')) {
    print "ok - -p 'directory' == -p 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -p 'directory' == -p 'D�@�\' $^X $__FILE__\n";
}

if (((-p DIR1) ne '') == ((-p DIR2) ne '')) {
    print "ok - -p DIR1 == -p DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -p DIR1 == -p DIR2 $^X $__FILE__\n";
}

if (((-S 'directory') ne '') == ((-S 'D�@�\') ne '')) {
    print "ok - -S 'directory' == -S 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -S 'directory' == -S 'D�@�\' $^X $__FILE__\n";
}

if (((-S DIR1) ne '') == ((-S DIR2) ne '')) {
    print "ok - -S DIR1 == -S DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -S DIR1 == -S DIR2 $^X $__FILE__\n";
}

if (((-b 'directory') ne '') == ((-b 'D�@�\') ne '')) {
    print "ok - -b 'directory' == -b 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -b 'directory' == -b 'D�@�\' $^X $__FILE__\n";
}

if (((-b DIR1) ne '') == ((-b DIR2) ne '')) {
    print "ok - -b DIR1 == -b DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -b DIR1 == -b DIR2 $^X $__FILE__\n";
}

if (((-c 'directory') ne '') == ((-c 'D�@�\') ne '')) {
    print "ok - -c 'directory' == -c 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -c 'directory' == -c 'D�@�\' $^X $__FILE__\n";
}

if (((-c DIR1) ne '') == ((-c DIR2) ne '')) {
    print "ok - -c DIR1 == -c DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -c DIR1 == -c DIR2 $^X $__FILE__\n";
}

if (((-t 'directory') ne '') == ((-t 'D�@�\') ne '')) {
    print "ok - -t 'directory' == -t 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -t 'directory' == -t 'D�@�\' $^X $__FILE__\n";
}

if (((-t DIR1) ne '') == ((-t DIR2) ne '')) {
    print "ok - -t DIR1 == -t DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -t DIR1 == -t DIR2 $^X $__FILE__\n";
}

if (((-u 'directory') ne '') == ((-u 'D�@�\') ne '')) {
    print "ok - -u 'directory' == -u 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -u 'directory' == -u 'D�@�\' $^X $__FILE__\n";
}

if (((-u DIR1) ne '') == ((-u DIR2) ne '')) {
    print "ok - -u DIR1 == -u DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -u DIR1 == -u DIR2 $^X $__FILE__\n";
}

if (((-g 'directory') ne '') == ((-g 'D�@�\') ne '')) {
    print "ok - -g 'directory' == -g 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -g 'directory' == -g 'D�@�\' $^X $__FILE__\n";
}

if (((-g DIR1) ne '') == ((-g DIR2) ne '')) {
    print "ok - -g DIR1 == -g DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -g DIR1 == -g DIR2 $^X $__FILE__\n";
}

if (((-k 'directory') ne '') == ((-k 'D�@�\') ne '')) {
    print "ok - -k 'directory' == -k 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -k 'directory' == -k 'D�@�\' $^X $__FILE__\n";
}

if (((-k DIR1) ne '') == ((-k DIR2) ne '')) {
    print "ok - -k DIR1 == -k DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -k DIR1 == -k DIR2 $^X $__FILE__\n";
}

if (((-T 'directory') ne '') == ((-T 'D�@�\') ne '')) {
    print "ok - -T 'directory' == -T 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -T 'directory' == -T 'D�@�\' $^X $__FILE__\n";
}

if (((-T DIR1) ne '') == ((-T DIR2) ne '')) {
    print "ok - -T DIR1 == -T DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -T DIR1 == -T DIR2 $^X $__FILE__\n";
}

if (((-B 'directory') ne '') == ((-B 'D�@�\') ne '')) {
    print "ok - -B 'directory' == -B 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -B 'directory' == -B 'D�@�\' $^X $__FILE__\n";
}

if (((-B DIR1) ne '') == ((-B DIR2) ne '')) {
    print "ok - -B DIR1 == -B DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -B DIR1 == -B DIR2 $^X $__FILE__\n";
}

if (((-M 'directory') ne '') == ((-M 'D�@�\') ne '')) {
    print "ok - -M 'directory' == -M 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -M 'directory' == -M 'D�@�\' $^X $__FILE__\n";
}

if (((-M DIR1) ne '') == ((-M DIR2) ne '')) {
    print "ok - -M DIR1 == -M DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -M DIR1 == -M DIR2 $^X $__FILE__\n";
}

if (((-A 'directory') ne '') == ((-A 'D�@�\') ne '')) {
    print "ok - -A 'directory' == -A 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -A 'directory' == -A 'D�@�\' $^X $__FILE__\n";
}

if (((-A DIR1) ne '') == ((-A DIR2) ne '')) {
    print "ok - -A DIR1 == -A DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -A DIR1 == -A DIR2 $^X $__FILE__\n";
}

if (((-C 'directory') ne '') == ((-C 'D�@�\') ne '')) {
    print "ok - -C 'directory' == -C 'D�@�\' $^X $__FILE__\n";
}
else {
    print "not ok - -C 'directory' == -C 'D�@�\' $^X $__FILE__\n";
}

if (((-C DIR1) ne '') == ((-C DIR2) ne '')) {
    print "ok - -C DIR1 == -C DIR2 $^X $__FILE__\n";
}
else {
    print "not ok - -C DIR1 == -C DIR2 $^X $__FILE__\n";
}

__END__
