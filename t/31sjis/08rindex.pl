use Sjis;

my $__FILE__ = __FILE__;

$_ = '��������������������';
if (rindex($_,'����') == 12) {
    print qq{ok - 1 rindex(\$_,'����') == 12 $^X $__FILE__\n};
}
else {
    print qq{not ok - 1 rindex(\$_,'����') == 12 $^X $__FILE__\n};
}

$_ = '��������������������';
if (rindex($_,'����',10) == 2) {
    print qq{ok - 2 rindex(\$_,'����',10) == 2 $^X $__FILE__\n};
}
else {
    print qq{not ok - 2 rindex(\$_,'����',10) == 2 $^X $__FILE__\n};
}

$_ = '��������������������';
if (Sjis::rindex($_,'����') == 6) {
    print qq{ok - 3 Sjis::rindex(\$_,'����') == 6 $^X $__FILE__\n};
}
else {
    print qq{not ok - 3 Sjis::rindex(\$_,'����') == 6 $^X $__FILE__\n};
}

$_ = '��������������������';
if (Sjis::rindex($_,'����',5) == 1) {
    print qq{ok - 4 Sjis::rindex(\$_,'����',5) == 1 $^X $__FILE__\n};
}
else {
    print qq{not ok - 4 Sjis::rindex(\$_,'����',5) == 1 $^X $__FILE__\n};
}

