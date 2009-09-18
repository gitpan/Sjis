use Sjis;

# [\\]
if ("\\" =~ m/[\\]/) {
    print qq{ok - 1 "\\\\" =~ m/[\\\\]/\n};
}
else{
    print qq{not ok - 1 "\\\\" =~ m/[\\\\]/\n};
}

# [|]
if ("|" =~ m/[|]/) {
    print qq{ok - 2 "|" =~ m/[|]/\n};
}
else{
    print qq{not ok - 2 "|" =~ m/[|]/\n};
}

# [(]
if ("(" =~ m/[(]/) {
    print qq{ok - 3 "(" =~ m/[(]/\n};
}
else{
    print qq{not ok - 3 "(" =~ m/[(]/\n};
}

# [)]
if (")" =~ m/[)]/) {
    print qq{ok - 4 ")" =~ m/[)]/\n};
}
else{
    print qq{not ok - 4 ")" =~ m/[)]/\n};
}

# [[]
if ("[" =~ m/[[]/) {
    print qq{ok - 5 "[" =~ m/[[]/\n};
}
else{
    print qq{not ok - 5 "[" =~ m/[[]/\n};
}

# [{]
if ("{" =~ m/[{]/) {
    print qq<ok - 6 "{" =~ m/[{]/\n>;
}
else{
    print qq<not ok - 6 "{" =~ m/[{]/\n>;
}

# [\^]
if ("^" =~ m/[\^]/) {
    print qq{ok - 7 "^" =~ m/[\\^]/\n};
}
else{
    print qq{not ok - 7 "^" =~ m/[\\^]/\n};
}

# [\$]
if ("\$" =~ m/[\$]/) {
    print qq{ok - 8 "\\\$" =~ m/[\\\$]/\n};
}
else{
    print qq{not ok - 8 "\\\$" =~ m/[\\\$]/\n};
}

# [*]
if ("*" =~ m/[*]/) {
    print qq{ok - 9 "*" =~ m/[*]/\n};
}
else{
    print qq{not ok - 9 "*" =~ m/[*]/\n};
}

# [+]
if ("+" =~ m/[+]/) {
    print qq{ok - 10 "+" =~ m/[+]/\n};
}
else{
    print qq{not ok - 10 "+" =~ m/[+]/\n};
}

# [?]
if ("?" =~ m/[?]/) {
    print qq{ok - 11 "?" =~ m/[?]/\n};
}
else{
    print qq{not ok - 11 "?" =~ m/[?]/\n};
}

# [.]
if ("." =~ m/[.]/) {
    print qq{ok - 12 "." =~ m/[.]/\n};
}
else{
    print qq{not ok - 12 "." =~ m/[.]/\n};
}
if ("A" !~ m/[.]/) {
    print qq{ok - 13 "A" !~ m/[.]/\n};
}
else{
    print qq{not ok - 13 "A" !~ m/[.]/\n};
}

# [-]
if ("-" =~ m/[-]/) {
    print qq{ok - 14 "-" =~ m/[-]/\n};
}
else{
    print qq{not ok - 14 "-" =~ m/[-]/\n};
}

# [A-]
if ("A" =~ m/[A-]/) {
    print qq{ok - 15 "A" =~ m/[A-]/\n};
}
else{
    print qq{not ok - 15 "A" =~ m/[A-]/\n};
}
if ("-" =~ m/[A-]/) {
    print qq{ok - 16 "-" =~ m/[A-]/\n};
}
else{
    print qq{not ok - 16 "-" =~ m/[A-]/\n};
}

# [-Z]
if ("-" =~ m/[-Z]/) {
    print qq{ok - 17 "-" =~ m/[-Z]/\n};
}
else{
    print qq{not ok - 17 "-" =~ m/[-Z]/\n};
}
if ("Z" =~ m/[-Z]/) {
    print qq{ok - 18 "Z" =~ m/[-Z]/\n};
}
else{
    print qq{not ok - 18 "Z" =~ m/[-Z]/\n};
}

# [--Z]
if ("-" =~ m/[--Z]/) {
    print qq{ok - 19 "-" =~ m/[--Z]/\n};
}
else{
    print qq{not ok - 19 "-" =~ m/[--Z]/\n};
}
if ("A" =~ m/[--Z]/) {
    print qq{ok - 20 "A" =~ m/[--Z]/\n};
}
else{
    print qq{not ok - 20 "A" =~ m/[--Z]/\n};
}
if ("Z" =~ m/[--Z]/) {
    print qq{ok - 21 "Z" =~ m/[--Z]/\n};
}
else{
    print qq{not ok - 21 "Z" =~ m/[--Z]/\n};
}

# [^-]
if ("-" !~ m/[^-]/) {
    print qq{ok - 22 "-" !~ m/[^-]/\n};
}
else{
    print qq{not ok - 22 "-" !~ m/[^-]/\n};
}
if ("A" =~ m/[^-]/) {
    print qq{ok - 23 "A" =~ m/[^-]/\n};
}
else{
    print qq{not ok - 23 "A" =~ m/[^-]/\n};
}

# [^A-]
if ("A" !~ m/[^A-]/) {
    print qq{ok - 24 "A" !~ m/[^A-]/\n};
}
else{
    print qq{not ok - 24 "A" !~ m/[^A-]/\n};
}
if ("-" !~ m/[^A-]/) {
    print qq{ok - 25 "-" !~ m/[^A-]/\n};
}
else{
    print qq{not ok - 25 "-" !~ m/[^A-]/\n};
}

# [^-Z]
if ("-" !~ m/[^-Z]/) {
    print qq{ok - 26 "-" !~ m/[^-Z]/\n};
}
else{
    print qq{not ok - 26 "-" !~ m/[^-Z]/\n};
}
if ("Z" !~ m/[^-Z]/) {
    print qq{ok - 27 "Z" !~ m/[^-Z]/\n};
}
else{
    print qq{not ok - 27 "Z" !~ m/[^-Z]/\n};
}

# [^--Z]
if ("-" !~ m/[^--Z]/) {
    print qq{ok - 28 "-" !~ m/[^--Z]/\n};
}
else{
    print qq{not ok - 28 "-" !~ m/[^--Z]/\n};
}
if ("A" !~ m/[^--Z]/) {
    print qq{ok - 29 "A" !~ m/[^--Z]/\n};
}
else{
    print qq{not ok - 29 "A" !~ m/[^--Z]/\n};
}
if ("Z" !~ m/[^--Z]/) {
    print qq{ok - 30 "Z" !~ m/[^--Z]/\n};
}
else{
    print qq{not ok - 30 "Z" !~ m/[^--Z]/\n};
}

# [^^]
if ("^" !~ m/[^^]/) {
    print qq{ok - 31 "^" !~ m/[^^]/\n};
}
else{
    print qq{not ok - 31 "^" !~ m/[^^]/\n};
}

__END__
