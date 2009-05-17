use strict;

mkdir('index', 0777);

my @c = (
    grep( ! /['\\]/, (map {chr($_)} (0x20..0x7E, 0xA1..0xDF))),
);

my @w = ();
for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        push @w, chr($c1) . chr($c2);
    }
}

my $script = "index\\index.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# index string, substr
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index '", $string, "', '", $c, "'; print \"\\n\";\n";
    print WANT 4, "\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index '", $string, "', '", $c, "'; print \"\\n\";\n";
    print WANT 8, "\n";
}

#----------------------------------------------------------------------------
# index(string, substr)
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index('", $string, "', '", $c, "'), \"\\n\";\n";
    print WANT 4, "\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index('", $string, "', '", $c, "'), \"\\n\";\n";
    print WANT 8, "\n";
}

#----------------------------------------------------------------------------
# index string, substr, start
#----------------------------------------------------------------------------

for my $start (0,1,4) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
        print WANT 4, "\n";
    }
}

for my $start (5,9) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
        print WANT 9, "\n";
    }
}

for my $start (0,2,8) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
        print WANT 8, "\n";
    }
}

for my $start (10,18) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, "; print \"\\n\";\n";
        print WANT 18, "\n";
    }
}

#----------------------------------------------------------------------------
# index(string, substr, start)
#----------------------------------------------------------------------------

for my $start (0,1,4) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
        print WANT 4, "\n";
    }
}

for my $start (5,9) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
        print WANT 9, "\n";
    }
}

for my $start (0,2,8) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
        print WANT 8, "\n";
    }
}

for my $start (10,18) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, "), \"\\n\";\n";
        print WANT 18, "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
