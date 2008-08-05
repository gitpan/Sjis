use strict;

mkdir('rindex', 0777);

my @c = (
    grep( ! /['\\]/, (map {chr($_)} (0x20..0x7E, 0xA1..0xDF))),
);

my @w = ();
for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        push @w, chr($c1) . chr($c2);
    }
}

my $script = "rindex\\rindex.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# rindex string, substr
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print rindex '", $string, "', '", $c, "'; print \"\\n\";\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print rindex '", $string, "', '", $c, "'; print \"\\n\";\n";
}

#----------------------------------------------------------------------------
# rindex(string, substr)
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print rindex('", $string, "', '", $c, "'), \"\\n\";\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print rindex('", $string, "', '", $c, "'), \"\\n\";\n";
}

#----------------------------------------------------------------------------
# rindex string, substr, start
#----------------------------------------------------------------------------

for my $start (15,14,13,12) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print rindex '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
    }
}

for my $start (30,28,26,24) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print rindex '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
    }
}

#----------------------------------------------------------------------------
# rindex(string, substr, start)
#----------------------------------------------------------------------------

for my $start (15,14,13,12) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print rindex('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
    }
}

for my $start (30,28,26,24) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print rindex('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
    }
}

close(SCRIPT);

#----------------------------------------------------------------------------
