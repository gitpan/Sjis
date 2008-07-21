use strict;

mkdir('q', 0777);

my @c = (
    (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "q\\q.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# ' '
#----------------------------------------------------------------------------

for my $c (@c) {

    if ($c eq "\\c[") {
        next;
    }

    if ($c =~ /^['\\]$/) {
        print SCRIPT "'\\", $c, "';\n";
    }
    else {
        print SCRIPT "'", $c, "';\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "'", chr($c1), chr($c2), "';\n";
    }
}

#----------------------------------------------------------------------------
# <<'HEREDOC'
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "<<'HEREDOC';\n", $c, "\nHEREDOC\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "<<'HEREDOC';\n", chr($c1), chr($c2), "\nHEREDOC\n";
    }
}

#----------------------------------------------------------------------------
# <<\HEREDOC
#----------------------------------------------------------------------------

for my $c (@c) {
    print SCRIPT "<<\\HEREDOC;\n", $c, "\nHEREDOC\n";
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "<<\\HEREDOC;\n", chr($c1), chr($c2), "\nHEREDOC\n";
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
        if ($c eq "\\c[") {
            next;
        }

        if ($c =~ /^(\\|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
            print SCRIPT 'q', $delimiter, '\\', $c, $end_delimiter, ";\n";
        }
        else {
            print SCRIPT 'q', $delimiter, $c, $end_delimiter, ";\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {
            print SCRIPT 'q', $delimiter, chr($c1), chr($c2), $end_delimiter, ";\n";
        }
    }

    close(SCRIPT);
}

#----------------------------------------------------------------------------
