use Sjis;

# �u^�v�Ƃ������K�\�����g�����ꍇ

$_ = "�`�`�`\n�a�a�a\n�b�b�b";
@_ = split(m/^/, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`\n)(�a�a�a\n)(�b�b�b)") {
    print qq{ok - 1 \@_ = split(m/^/, \$\_)\n};
}
else {
    print qq{not ok - 1 \@_ = split(m/^/, \$\_)\n};
}

$_ = "�`�`�`1\n2�a�a�a1\n2�b�b�b";
@_ = split(m/^2/, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`1\n)(�a�a�a1\n)(�b�b�b)") {
    print qq{ok - 2 \@_ = split(m/^2/, \$\_)\n};
}
else {
    print qq{not ok - 2 \@_ = split(m/^2/, \$\_)\n};
    print "<<", join('', map {"($_)"} @_), ">>\n";
}

$_ = "�`�`�`1\n2�a�a�a1\n2�b�b�b";
@_ = split(m/^2/m, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`1\n)(�a�a�a1\n)(�b�b�b)") {
    print qq{ok - 3 \@_ = split(m/^2/m, \$\_)\n};
}
else {
    print qq{not ok - 3 \@_ = split(m/^2/m, \$\_)\n};
    print "<<", join('', map {"($_)"} @_), ">>\n";
}

$_ = "�`�`�`1\n2�a�a�a1\n2�b�b�b";
@_ = split(m/1^/, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`1\n2�a�a�a1\n2�b�b�b)") {
    print qq{ok - 4 \@_ = split(m/1^/, \$\_)\n};
}
else {
    print qq{not ok - 4 \@_ = split(m/1^/, \$\_)\n};
}

$_ = "�`�`�`1\n2�a�a�a1\n2�b�b�b";
@_ = split(m/1\n^2/, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`)(�a�a�a)(�b�b�b)") {
    print qq{ok - 5 \@_ = split(m/1\\n^2/, \$\_)\n};
}
else {
    print qq{not ok - 5 \@_ = split(m/1\\n^2/, \$\_)\n};
    print "<<", join('', map {"($_)"} @_), ">>\n";
}

$_ = "�`�`�`1\n2�a�a�a1\n2�b�b�b";
@_ = split(m/1\n^2/m, $_);
if (join('', map {"($_)"} @_) eq "(�`�`�`)(�a�a�a)(�b�b�b)") {
    print qq{ok - 6 \@_ = split(m/1\\n^2/m, \$\_)\n};
}
else {
    print qq{not ok - 6 \@_ = split(m/1\\n^2/m, \$\_)\n};
    print "<<", join('', map {"($_)"} @_), ">>\n";
}

__END__