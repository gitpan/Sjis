use strict;

mkdir('q', 0777);

my @c = (
    grep {$_ ne '\\c['} (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "q\\q.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# ' '
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^['\\]$/) {
        print SCRIPT "print '\\", $c, "', \"\\n\";\n";
    }
    else {
        print SCRIPT "print '", $c, "', \"\\n\";\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print '", chr($c1), chr($c2), "', \"\\n\";\n";
    }
}

#----------------------------------------------------------------------------
# <<'HEREDOC'
#----------------------------------------------------------------------------

for my $c (@c, '\\c[') {
    print SCRIPT "print <<'HEREDOC';\n", $c, "\nHEREDOC\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print <<'HEREDOC';\n", chr($c1), chr($c2), "\nHEREDOC\n";
    }
}

#----------------------------------------------------------------------------
# <<\HEREDOC
#----------------------------------------------------------------------------

for my $c (@c, '\\c[') {
    print SCRIPT "print <<\\HEREDOC;\n", $c, "\nHEREDOC\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "print <<\\HEREDOC;\n", chr($c1), chr($c2), "\nHEREDOC\n";
    }
}

close(SCRIPT);

#----------------------------------------------------------------------------
# q * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>]$/) {
        next;
    }

    my $script = sprintf("q\\q-%02X.pl", $delim);
    open(SCRIPT,">$script") || die "Can't open file: $script\n";

    my $end_delimiter = {
                        '(' => ')',
                        '{' => '}',
                        '[' => ']',
                        '<' => '>',
                    }->{$delimiter} || $delimiter;

    for my $c (@c) {

        if (($delimiter eq '=') and ($c eq '>')) {
            next;
        }

        if ($c =~ /^(\\|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
            print SCRIPT 'print q', $delimiter, '\\', $c, $end_delimiter, ", \"\\n\";\n";
        }
        else {
            print SCRIPT 'print q', $delimiter, $c, $end_delimiter, ", \"\\n\";\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {
            print SCRIPT 'print q', $delimiter, chr($c1), chr($c2), $end_delimiter, ", \"\\n\";\n";
        }
    }

    close(SCRIPT);
}

#----------------------------------------------------------------------------
