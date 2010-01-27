use Sjis;

my $aaa = 'AAA';
my $bbb = 'BBB';

if (<<'END' eq "ソ\$aaaソ\n" and <<'END' eq "表\$bbb表\n") {
ソ$aaaソ
END
表$bbb表
END
    print qq{ok - 1 <<'END' and <<'END'\n};
}
else {
    print qq{not ok - 1 <<'END' and <<'END'\n};
}

if (<<\END eq "ソ\$aaaソ\n" and <<\END eq "表\$bbb表\n") {
ソ$aaaソ
END
表$bbb表
END
    print qq{ok - 2 <<\\END and <<\\END\n};
}
else {
    print qq{not ok - 2 <<\\END and <<\\END\n};
}

if (<<END eq "ソ\L$aaaソ\n" and <<END eq "表\L$bbb\E表\n") {
ソ\L$aaaソ
END
表\L$bbb\E表
END
    print qq{ok - 3 <<END and <<END\n};
}
else {
    print qq{not ok - 3 <<END and <<END\n};
}

if (<<"END" eq "ソ\L$aaaソ\n" and <<"END" eq "表\L$bbb\E表\n") {
ソ\L$aaaソ
END
表\L$bbb\E表
END
    print qq{ok - 4 <<"END" and <<"END"\n};
}
else {
    print qq{not ok - 4 <<"END" and <<"END"\n};
}

if (<<'END' eq "ソ\$aaaソ\n" and <<END eq "ソ$aaaソ\n" and <<'END' eq "表\$bbb表\n") {
ソ$aaaソ
END
ソ$aaaソ
END
表$bbb表
END
    print qq{ok - 5 <<'END' and <<"END" and <<'END'\n};
}
else {
    print qq{not ok - 5 <<'END' and <<"END" and <<'END'\n};
}

if (<<END eq "ソ\L$aaaソ\n" and <<'END' eq "表\$bbb表\n" and <<END eq "表\L$bbb\E表\n") {
ソ\L$aaaソ
END
表$bbb表
END
表\L$bbb\E表
END
    print qq{ok - 6 <<END and <<'END' and <<END\n};
}
else {
    print qq{not ok - 6 <<END and <<'END' and <<END\n};
}

__END__
