use strict;

mkdir('uc', 0777);

my @c = (
    grep {$_ ne '\\c['} (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "uc\\uc.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# uc
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "\$_ = '", $c, "'; print uc, \"\\n\";\n";
        print WANT uc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print uc, \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print uc, \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print uc, \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# uc $_
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "\$_ = '", $c, "'; print uc \$_, \"\\n\";\n";
        print WANT uc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print uc \$_, \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print uc \$_, \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print uc \$_, \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# uc($_)
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "\$_ = '", $c, "'; print uc(\$_), \"\\n\";\n";
        print WANT uc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print uc(\$_), \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print uc(\$_), \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print uc(\$_), \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# uc $_, 'a', 'b', 'c'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "\$_ = '", $c, "'; print uc \$_, 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT uc($c), 'a', 'b', 'c', "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; print uc \$_, 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT $c, 'a', 'b', 'c', "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; print uc \$_, 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT $c, 'a', 'b', 'c', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; print uc \$_, 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT chr($c1), chr($c2), 'a', 'b', 'c', "\n";
    }
}

#----------------------------------------------------------------------------
# uc '*'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "print uc '", $c, "', \"\\n\";\n";
        print WANT uc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print uc '\\", $c, "', \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "print uc '", $c, "', \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print uc '", chr($c1), chr($c2), "', \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# uc('*')
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "print uc('", $c, "'), \"\\n\";\n";
        print WANT uc($c), "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print uc('\\", $c, "'), \"\\n\";\n";
        print WANT $c, "\n";
    }
    else {
        print SCRIPT "print uc('", $c, "'), \"\\n\";\n";
        print WANT $c, "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print uc('", chr($c1), chr($c2), "'), \"\\n\";\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# uc '*', 'a', 'b', 'c'
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[abcdefghijklmnopqrstuvwxyz]$/) {
        print SCRIPT "print uc '", $c, "', 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT uc($c), 'a', 'b', 'c', "\n";
    }
    elsif ($c =~ /^['\\]$/) {
        print SCRIPT "print uc '\\", $c, "', 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT $c, 'a', 'b', 'c', "\n";
    }
    else {
        print SCRIPT "print uc '", $c, "', 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT $c, 'a', 'b', 'c', "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print uc '", chr($c1), chr($c2), "', 'a', 'b', 'c'; print \"\\n\";\n";
        print WANT chr($c1), chr($c2), 'a', 'b', 'c', "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
