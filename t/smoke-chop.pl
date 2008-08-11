use strict;

mkdir('chop', 0777);

my @c = (
    grep {$_ ne '\\c['} (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "chop\\chop.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# chop
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; chop; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; chop; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; chop; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

#----------------------------------------------------------------------------
# chop $_
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; chop \$_; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; chop \$_; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; chop \$_; print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

#----------------------------------------------------------------------------
# chop($_)
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\$_ = '\\", $c, "'; chop(\$_); print \$_, \"\\n\";\n";
        print WANT "\n";
    }
    else {
        print SCRIPT "\$_ = '", $c, "'; chop(\$_); print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = '", chr($c1), chr($c2), "'; chop(\$_); print \$_, \"\\n\";\n";
        print WANT "\n";
    }
}

#----------------------------------------------------------------------------
# chop @_
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\@_ = (", "'\\", $c, "','\\", $c, "','\\", $c, "'", "); chop \@_; print \@_, \"\\n\";\n";
        print WANT "\n";
    }
    else {
        print SCRIPT "\@_ = (", "'", $c, "','", $c, "','", $c, "'", "); chop \@_; print \@_, \"\\n\";\n";
        print WANT "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\@_ = (", "'", chr($c1), chr($c2), "','", chr($c1), chr($c2), "','", chr($c1), chr($c2), "'", "); chop \@_; print \@_, \"\\n\";\n";
        print WANT "\n";
    }
}

#----------------------------------------------------------------------------
# chop(@_)
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "\@_ = (", "'\\", $c, "','\\", $c, "','\\", $c, "'", "); chop(\@_); print \@_, \"\\n\";\n";
        print WANT "\n";
    }
    else {
        print SCRIPT "\@_ = (", "'", $c, "','", $c, "','", $c, "'", "); chop(\@_); print \@_, \"\\n\";\n";
        print WANT "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\@_ = (", "'", chr($c1), chr($c2), "','", chr($c1), chr($c2), "','", chr($c1), chr($c2), "'", "); chop(\@_); print \@_, \"\\n\";\n";
        print WANT "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
