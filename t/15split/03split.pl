use Sjis;

$a = split;
if ($a == 0) {
    print qq{ok - 1 \$a = split\n};
}
else {
    print qq{not ok - 1 \$a = split\n};
}

@a = split;
if ("@a" eq '') {
    print qq{ok - 2 \@a = split\n};
}
else {
    print qq{not ok - 2 \@a = split\n};
}

$a = split /A/;
if ($a == 0) {
    print qq{ok - 3 \$a = split /A/\n};
}
else {
    print qq{not ok - 3 \$a = split /A/\n};
}

@a = split /A/;
if ("@a" eq '') {
    print qq{ok - 4 \@a = split /A/\n};
}
else {
    print qq{not ok - 4 \@a = split /A/\n};
}

$a = split /A/, undef;
if ($a == 0) {
    print qq{ok - 5 \$a = split /A/, undef\n};
}
else {
    print qq{not ok - 5 \$a = split /A/, undef\n};
}

@a = split /A/, undef;
if ("@a" eq '') {
    print qq{ok - 6 \@a = split /A/, undef\n};
}
else {
    print qq{not ok - 6 \@a = split /A/, undef\n};
}

$a = split /A/, '';
if ($a == 0) {
    print qq{ok - 7 \$a = split /A/, ''\n};
}
else {
    print qq{not ok - 7 \$a = split /A/, ''\n};
}

@a = split /A/, '';
if ("@a" eq '') {
    print qq{ok - 8 \@a = split /A/, ''\n};
}
else {
    print qq{not ok - 8 \@a = split /A/, ''\n};
}

$a = split /A/, '', 3;
if ($a == 0) {
    print qq{ok - 9 \$a = split /A/, '', 3\n};
}
else {
    print qq{not ok - 9 \$a = split /A/, '', 3\n};
}

@a = split /A/, '', 3;
if ("@a" eq '') {
    print qq{ok - 10 \@a = split /A/, '', 3\n};
}
else {
    print qq{not ok - 10 \@a = split /A/, '', 3\n};
}

__END__
