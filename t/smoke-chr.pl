use strict;

mkdir('chr', 0777);

my @c = (
    0x20..0x7E, 0xA1..0xDF,
);

my $script = "chr\\chr.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# chr
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "\$_ = $c; print chr, \"\\n\";\n";
    print WANT pack('C',$c), "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = ", $c1 * 256 + $c2, "; print chr, \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), "\n";
    }
}

#----------------------------------------------------------------------------
# chr $_
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "\$_ = $c; print chr \$_, \"\\n\";\n";
    print WANT pack('C',$c), "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = ", $c1 * 256 + $c2, "; print chr \$_, \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), "\n";
    }
}

#----------------------------------------------------------------------------
# chr($_)
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "\$_ = $c; print chr(\$_), \"\\n\";\n";
    print WANT pack('C',$c), "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = ", $c1 * 256 + $c2, "; print chr(\$_), \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), "\n";
    }
}

#----------------------------------------------------------------------------
# chr $_, 0x41, 0x42, 0x43
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "\$_ = $c; print chr \$_, 0x41, 0x42, 0x43, \"\\n\";\n";
    print WANT pack('C',$c), 0x41, 0x42, 0x43, "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = ", $c1 * 256 + $c2, "; print chr \$_, 0x41, 0x42, 0x43, \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), 0x41, 0x42, 0x43, "\n";
    }
}

#----------------------------------------------------------------------------
# chr *
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "print chr $c, \"\\n\";\n";
    print WANT pack('C',$c), "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print chr ", $c1 * 256 + $c2, ", \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), "\n";
    }
}

#----------------------------------------------------------------------------
# chr(*)
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "print chr($c), \"\\n\";\n";
    print WANT pack('C',$c), "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print chr(", $c1 * 256 + $c2, "), \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), "\n";
    }
}

#----------------------------------------------------------------------------
# chr *, 0x41, 0x42, 0x43
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "print chr $c, 0x41, 0x42, 0x43, \"\\n\";\n";
    print WANT pack('C',$c), 0x41, 0x42, 0x43, "\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print chr ", $c1 * 256 + $c2, ", 0x41, 0x42, 0x43, \"\\n\";\n";
        print WANT pack('CC',$c1,$c2), 0x41, 0x42, 0x43, "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------