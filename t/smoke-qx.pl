use strict;

mkdir('qx', 0777);

my @c = grep ! /^[.?*:\\<>|"&]$/, (
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
#   (map {sprintf('\\%03o',$_)}    (0x20..0x7E, 0xA1..0xDF)),
#   (map {sprintf('\\x%02x',$_)}   (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "qx\\qx.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# ` `
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[`\\\$\@]$/) {
        print SCRIPT 'print `qx\\\\\\', $c, "`;\n";
    }
    else {
        print SCRIPT 'print `qx\\\\', $c, "`;\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT 'print `qx\\\\', chr($c1), chr($c2), "`;\n";
    }
}

#----------------------------------------------------------------------------
# <<`HEREDOC`
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^[\\\$\@]$/) {
        print SCRIPT 'print <<`HEREDOC`;', "\n", 'qx\\\\\\', $c, "\nHEREDOC\n";
    }
    else {
        print SCRIPT 'print <<`HEREDOC`;', "\n", 'qx\\\\', $c, "\nHEREDOC\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT 'print <<`HEREDOC`;', "\n", 'qx\\\\', chr($c1), chr($c2), "\nHEREDOC\n";
    }
}

close(SCRIPT);

#----------------------------------------------------------------------------
# qx * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>]$/) {
        next;
    }

    my $script = sprintf("qx\\qx-%02X.pl", $delim);
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
        if (($delimiter eq '$') and ($c eq '$')) {
            next;
        }
        if (($delimiter eq "'") and ($c eq '\\c[')) {
            next;
        }
        if (($delimiter eq '@') and ($c eq '\\c@')) {
            next;
        }
        if (($delimiter eq '^') and ($c eq '\\c^')) {
            next;
        }

        if ($c =~ /^([\\\$\@]|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
            print SCRIPT 'print qx', $delimiter, 'qx\\\\\\', $c, $end_delimiter, ";\n";
        }
        else {
            print SCRIPT 'print qx', $delimiter, 'qx\\\\', $c, $end_delimiter, ";\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {
            print SCRIPT 'print qx', $delimiter, 'qx\\\\', chr($c1), chr($c2), $end_delimiter, ";\n";
        }
    }

    close(SCRIPT);
}

#----------------------------------------------------------------------------
# *.BAT
#----------------------------------------------------------------------------

for my $c (@c) {
    open(BAT,">qx\\$c.bat") || die "Can't open file: qx\\$c.bat";
    print BAT "\@echo off\n";
    print BAT "echo ", $c, "\n";
    close BAT;
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        open(BAT,">qx\\".chr($c1).chr($c2).".bat") || die "Can't open file: qx\\", chr($c1), chr($c2), ".bat";
        print BAT "\@echo off\n";
        print BAT "echo ", chr($c1), chr($c2), "\n";
        close BAT;
    }
}

#----------------------------------------------------------------------------
