use Sjis;

my $aaa = 'AAA';
my $bbb = 'BBB';

if (<<'END' eq "�\\$aaa�\\n" and <<'END' eq "�\\$bbb�\\n") {
�\$aaa�\
END
�\$bbb�\
END
    print qq{ok - 1 <<'END' and <<'END'\n};
}
else {
    print qq{not ok - 1 <<'END' and <<'END'\n};
}

if (<<\END eq "�\\$aaa�\\n" and <<\END eq "�\\$bbb�\\n") {
�\$aaa�\
END
�\$bbb�\
END
    print qq{ok - 2 <<\\END and <<\\END\n};
}
else {
    print qq{not ok - 2 <<\\END and <<\\END\n};
}

if (<<END eq "�\\L$aaa�\\n" and <<END eq "�\\L$bbb\E�\\n") {
�\\L$aaa�\
END
�\\L$bbb\E�\
END
    print qq{ok - 3 <<END and <<END\n};
}
else {
    print qq{not ok - 3 <<END and <<END\n};
}

if (<<"END" eq "�\\L$aaa�\\n" and <<"END" eq "�\\L$bbb\E�\\n") {
�\\L$aaa�\
END
�\\L$bbb\E�\
END
    print qq{ok - 4 <<"END" and <<"END"\n};
}
else {
    print qq{not ok - 4 <<"END" and <<"END"\n};
}

if (<<'END' eq "�\\$aaa�\\n" and <<END eq "�\$aaa�\\n" and <<'END' eq "�\\$bbb�\\n") {
�\$aaa�\
END
�\$aaa�\
END
�\$bbb�\
END
    print qq{ok - 5 <<'END' and <<"END" and <<'END'\n};
}
else {
    print qq{not ok - 5 <<'END' and <<"END" and <<'END'\n};
}

if (<<END eq "�\\L$aaa�\\n" and <<'END' eq "�\\$bbb�\\n" and <<END eq "�\\L$bbb\E�\\n") {
�\\L$aaa�\
END
�\$bbb�\
END
�\\L$bbb\E�\
END
    print qq{ok - 6 <<END and <<'END' and <<END\n};
}
else {
    print qq{not ok - 6 <<END and <<'END' and <<END\n};
}

__END__
