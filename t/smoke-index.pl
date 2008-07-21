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
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# index string, substr
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index '", $string, "', '", $c, "';\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index '", $string, "', '", $c, "';\n";
}

#----------------------------------------------------------------------------
# index(string, substr)
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    my $a = $c[($i-1) % scalar(@c)] x 2;
    my $b = $c[($i+1) % scalar(@c)] x 2;
    my $c = $c[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index('", $string, "', '", $c, "');\n";
}

for my $i (0 .. $#w) {
    my $a = $w[($i-1) % scalar(@c)] x 2;
    my $b = $w[($i+1) % scalar(@c)] x 2;
    my $c = $w[$i];
    my $string = ($a . $b . $c) x 3;
    print SCRIPT "print index('", $string, "', '", $c, "');\n";
}

#----------------------------------------------------------------------------
# index string, substr, start
#----------------------------------------------------------------------------

for my $start (0,1,2,3) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, ";\n";
    }
}

for my $start (0,2,4,6) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index '", $string, "', '", $c, "', ", $start, ";\n";
    }
}

#----------------------------------------------------------------------------
# index(string, substr, start)
#----------------------------------------------------------------------------

for my $start (0,1,2,3) {
    for my $i (0 .. $#c) {
        my $a = $c[($i-1) % scalar(@c)] x 2;
        my $b = $c[($i+1) % scalar(@c)] x 2;
        my $c = $c[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, ");\n";
    }
}

for my $start (0,2,4,6) {
    for my $i (0 .. $#w) {
        my $a = $w[($i-1) % scalar(@c)] x 2;
        my $b = $w[($i+1) % scalar(@c)] x 2;
        my $c = $w[$i];
        my $string = ($a . $b . $c) x 3;
        print SCRIPT "print index('", $string, "', '", $c, "', ", $start, ");\n";
    }
}

close(SCRIPT);

#----------------------------------------------------------------------------
