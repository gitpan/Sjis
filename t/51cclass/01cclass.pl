use Sjis;

if ("‚ " =~ /./) {
    print qq{ok - 1 . without /s ‚ \n};
}
else {
    print qq{not ok - 1 . without /s ‚ \n};
}

if ("\n" !~ /./) {
    print qq{ok - 2 . without /s \\n\n};
}
else {
    print qq{not ok - 2 . without /s \\n\n};
}

if ("‚ " =~ /./s) {
    print qq{ok - 3 . with /s ‚ \n};
}
else {
    print qq{not ok - 3 . with /s ‚ \n};
}

if ("\n" =~ /./s) {
    print qq{ok - 4 . with /s \\n\n};
}
else {
    print qq{not ok - 4 . with /s \\n\n};
}

if ("3" =~ /\d/) {
    print qq{ok - 5 \\d 3\n};
}
else {
    print qq{not ok - 5 \\d 3\n};
}

if ("\x09" =~ /\s/) {
    print qq{ok - 6 \\s \\x09\n};
}
else {
    print qq{not ok - 6 \\s \\x09\n};
}

if ("\x0A" =~ /\s/) {
    print qq{ok - 7 \\s \\x0A\n};
}
else {
    print qq{not ok - 7 \\s \\x0A\n};
}

if ("\x0C" =~ /\s/) {
    print qq{ok - 8 \\s \\x0C\n};
}
else {
    print qq{not ok - 8 \\s \\x0C\n};
}

if ("\x0D" =~ /\s/) {
    print qq{ok - 9 \\s \\x0D\n};
}
else {
    print qq{not ok - 9 \\s \\x0D\n};
}

if ("\x20" =~ /\s/) {
    print qq{ok - 10 \\s \\x20\n};
}
else {
    print qq{not ok - 10 \\s \\x20\n};
}

if ("0" =~ /\w/) {
    print qq{ok - 11 \\w 0\n};
}
else {
    print qq{not ok - 11 \\w 0\n};
}

if ("9" =~ /\w/) {
    print qq{ok - 12 \\w 9\n};
}
else {
    print qq{not ok - 12 \\w 9\n};
}

if ("A" =~ /\w/) {
    print qq{ok - 13 \\w A\n};
}
else {
    print qq{not ok - 13 \\w A\n};
}

if ("Z" =~ /\w/) {
    print qq{ok - 14 \\w Z\n};
}
else {
    print qq{not ok - 14 \\w Z\n};
}

if ("_" =~ /\w/) {
    print qq{ok - 15 \\w _\n};
}
else {
    print qq{not ok - 15 \\w _\n};
}

if ("a" =~ /\w/) {
    print qq{ok - 16 \\w a\n};
}
else {
    print qq{not ok - 16 \\w a\n};
}

if ("z" =~ /\w/) {
    print qq{ok - 17 \\w z\n};
}
else {
    print qq{not ok - 17 \\w z\n};
}

if ("3" !~ /\D/) {
    print qq{ok - 18 \\D 3\n};
}
else {
    print qq{not ok - 18 \\D 3\n};
}

if ("\x09" !~ /\S/) {
    print qq{ok - 19 \\S \\x09\n};
}
else {
    print qq{not ok - 19 \\S \\x09\n};
}

if ("\x0A" !~ /\S/) {
    print qq{ok - 20 \\S \\x0A\n};
}
else {
    print qq{not ok - 20 \\S \\x0A\n};
}

if ("\x0C" !~ /\S/) {
    print qq{ok - 21 \\S \\x0C\n};
}
else {
    print qq{not ok - 21 \\S \\x0C\n};
}

if ("\x0D" !~ /\S/) {
    print qq{ok - 22 \\S \\x0D\n};
}
else {
    print qq{not ok - 22 \\S \\x0D\n};
}

if ("\x20" !~ /\S/) {
    print qq{ok - 23 \\S \\x20\n};
}
else {
    print qq{not ok - 23 \\S \\x20\n};
}

if ("0" !~ /\W/) {
    print qq{ok - 24 \\W 0\n};
}
else {
    print qq{not ok - 24 \\W 0\n};
}

if ("9" !~ /\W/) {
    print qq{ok - 25 \\W 9\n};
}
else {
    print qq{not ok - 25 \\W 9\n};
}

if ("A" !~ /\W/) {
    print qq{ok - 26 \\W A\n};
}
else {
    print qq{not ok - 26 \\W A\n};
}

if ("Z" !~ /\W/) {
    print qq{ok - 27 \\W Z\n};
}
else {
    print qq{not ok - 27 \\W Z\n};
}

if ("_" !~ /\W/) {
    print qq{ok - 28 \\W _\n};
}
else {
    print qq{not ok - 28 \\W _\n};
}

if ("a" !~ /\W/) {
    print qq{ok - 29 \\W a\n};
}
else {
    print qq{not ok - 29 \\W a\n};
}

if ("z" !~ /\W/) {
    print qq{ok - 30 \\W z\n};
}
else {
    print qq{not ok - 30 \\W z\n};
}

if ("\x09" =~ /\h/) {
    print qq{ok - 31 \\h \\x09\n};
}
else {
    print qq{not ok - 31 \\h \\x09\n};
}

if ("\x20" =~ /\h/) {
    print qq{ok - 32 \\h \\x20\n};
}
else {
    print qq{not ok - 32 \\h \\x20\n};
}

if ("\x0C" =~ /\v/) {
    print qq{ok - 33 \\v \\x0C\n};
}
else {
    print qq{not ok - 33 \\v \\x0C\n};
}

if ("\x0A" =~ /\v/) {
    print qq{ok - 34 \\v \\x0A\n};
}
else {
    print qq{not ok - 34 \\v \\x0A\n};
}

if ("\x0D" =~ /\v/) {
    print qq{ok - 35 \\v \\x0D\n};
}
else {
    print qq{not ok - 35 \\v \\x0D\n};
}

if ("\x09" !~ /\H/) {
    print qq{ok - 36 \\H \\x09\n};
}
else {
    print qq{not ok - 36 \\H \\x09\n};
}

if ("\x20" !~ /\H/) {
    print qq{ok - 37 \\H \\x20\n};
}
else {
    print qq{not ok - 37 \\H \\x20\n};
}

if ("\x0C" !~ /\V/) {
    print qq{ok - 38 \\V \\x0C\n};
}
else {
    print qq{not ok - 38 \\V \\x0C\n};
}

if ("\x0A" !~ /\V/) {
    print qq{ok - 39 \\V \\x0A\n};
}
else {
    print qq{not ok - 39 \\V \\x0A\n};
}

if ("\x0D" !~ /\V/) {
    print qq{ok - 40 \\V \\x0D\n};
}
else {
    print qq{not ok - 40 \\V \\x0D\n};
}

__END__
