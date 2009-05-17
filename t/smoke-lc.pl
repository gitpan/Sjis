use strict;

mkdir('lc', 0777);

my @c = (
    grep {$_ ne '\\c['} (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "lc\\lc.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# lc
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "\$_ = '", $c, "'; print lc, \"\\n\";\n";
        print WANT lc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print lc, \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print lc, \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print lc, \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# lc $_
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "\$_ = '", $c, "'; print lc \$_, \"\\n\";\n";
        print WANT lc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print lc \$_, \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print lc \$_, \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print lc \$_, \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# lc($_)
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "\$_ = '", $c, "'; print lc(\$_), \"\\n\";\n";
        print WANT lc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print lc(\$_), \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print lc(\$_), \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print lc(\$_), \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# lc $_, 'A', 'B', 'C'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "\$_ = '", $c, "'; print lc \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT lc($c), 'A', 'B', 'C', "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print lc \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c, 'A', 'B', 'C', "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print lc \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c, 'A', 'B', 'C', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print lc \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT chr($c1), chr($c2), 'A', 'B', 'C', "\n";
    }
}

#----------------------------------------------------------------------------
# lc '*'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "print lc '", $c, "', \"\\n\";\n";
        print WANT lc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print lc '\\", $c, "', \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "print lc '", $c, "', \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print lc '", chr($c1), chr($c2), "', \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# lc('*')
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "print lc('", $c, "'), \"\\n\";\n";
        print WANT lc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print lc('\\", $c, "'), \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "print lc('", $c, "'), \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print lc('", chr($c1), chr($c2), "'), \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# lc '*', 'A', 'B', 'C'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]$/) {
        print SCRIPT "print lc '", $c, "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT lc($c), 'A', 'B', 'C', "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print lc '\\", $c, "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c, 'A', 'B', 'C', "\n";
    }
    else {
        print SCRIPT "print lc '", $c, "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c, 'A', 'B', 'C', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print lc '", chr($c1), chr($c2), "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT chr($c1), chr($c2), 'A', 'B', 'C', "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
