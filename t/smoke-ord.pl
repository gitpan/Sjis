use strict;

mkdir('ord', 0777);

my @c = (
    grep {$_ ne '\\c['} (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "ord\\ord.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# ord
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print ord, \"\\n\";\n";
        print WANT ord($c), "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print ord, \"\\n\";\n";
        print WANT ord($c), "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print ord, \"\\n\";\n";
        print WANT $c1 * 256 + $c2, "\n";
    }
}

#----------------------------------------------------------------------------
# ord $_
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print ord \$_, \"\\n\";\n";
        print WANT ord($c), "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print ord \$_, \"\\n\";\n";
        print WANT ord($c), "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print ord \$_, \"\\n\";\n";
        print WANT $c1 * 256 + $c2, "\n";
    }
}

#----------------------------------------------------------------------------
# ord($_)
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print ord(\$_), \"\\n\";\n";
        print WANT ord($c), "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print ord(\$_), \"\\n\";\n";
        print WANT ord($c), "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print ord(\$_), \"\\n\";\n";
        print WANT $c1 * 256 + $c2, "\n";
    }
}

#----------------------------------------------------------------------------
# ord $_, 'A', 'B', 'C'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print ord \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT ord($c), 'A', 'B', 'C', "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print ord \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT ord($c), 'A', 'B', 'C', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print ord \$_, 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c1 * 256 + $c2, 'A', 'B', 'C', "\n";
    }
}

#----------------------------------------------------------------------------
# ord '*'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "print ord '\\", $c, "', \"\\n\";\n";
        print WANT ord($c), "\n";
    }
    else {
        print SCRIPT "print ord '", $c, "', \"\\n\";\n";
        print WANT ord($c), "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print ord '", chr($c1), chr($c2), "', \"\\n\";\n";
        print WANT $c1 * 256 + $c2, "\n";
    }
}

#----------------------------------------------------------------------------
# ord('*')
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "print ord('\\", $c, "'), \"\\n\";\n";
        print WANT ord($c), "\n";
    }
    else {
        print SCRIPT "print ord('", $c, "'), \"\\n\";\n";
        print WANT ord($c), "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print ord('", chr($c1), chr($c2), "'), \"\\n\";\n";
        print WANT $c1 * 256 + $c2, "\n";
    }
}

#----------------------------------------------------------------------------
# ord '*', 'A', 'B', 'C'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "print ord '\\", $c, "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT ord($c), 'A', 'B', 'C', "\n";
    }
    else {
        print SCRIPT "print ord '", $c, "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT ord($c), 'A', 'B', 'C', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print ord '", chr($c1), chr($c2), "', 'A', 'B', 'C'; print \"\\n\";\n";
        print WANT $c1 * 256 + $c2, 'A', 'B', 'C', "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
