use strict;

mkdir('qq', 0777);

my @c = (
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    qw( \n \r \t \f \b \a \e ),
    (map {sprintf('\\%03o',$_)}    (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\x%02x',$_)}   (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\c%c',$_)}     (0x40..0x5B, 0x5D..0x5F)),
    (map {sprintf('\\x{%02x}',$_)} (0x20..0x7E, 0xA1..0xDF)),
);

my @want_c = (
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    "\n", "\r", "\t", "\f", "\b", "\a", "\e",
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    (map {chr($_ & 0x1F)}          (0x40..0x5B, 0x5D..0x5F)),
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "qq\\qq.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# " "
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    if ($c[$i] =~ /^["\\\$\@]$/) {
        print SCRIPT 'print "\\', $c[$i], '", "\\n";', "\n";
        print WANT $c[$i], "\n";
    }
    else {
        print SCRIPT 'print "', $c[$i], '", "\\n";', "\n";
        print WANT $want_c[$i], "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT 'print "', chr($c1), chr($c2), '", "\\n";', "\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# <<"HEREDOC"
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    if ($c[$i] =~ /^[\\\$\@]$/) {
        print SCRIPT 'print <<"HEREDOC";', "\n", '\\', $c[$i], "\nHEREDOC\n";
        print WANT $want_c[$i], "\n";
    }
    else {
        print SCRIPT 'print <<"HEREDOC";', "\n", $c[$i], "\nHEREDOC\n";
        print WANT $want_c[$i], "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT 'print <<"HEREDOC";', "\n", chr($c1), chr($c2), "\nHEREDOC\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

#----------------------------------------------------------------------------
# <<HEREDOC
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    if ($c[$i] =~ /^[\\\$\@]$/) {
        print SCRIPT 'print <<HEREDOC;', "\n", '\\', $c[$i], "\nHEREDOC\n";
        print WANT $want_c[$i], "\n";
    }
    else {
        print SCRIPT 'print <<HEREDOC;', "\n", $c[$i], "\nHEREDOC\n";
        print WANT $want_c[$i], "\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT 'print <<HEREDOC;', "\n", chr($c1), chr($c2), "\nHEREDOC\n";
        print WANT chr($c1), chr($c2), "\n";
    }
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
# qq * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>]$/) {
        next;
    }

    my $script = sprintf("qq\\qq-%02X.pl", $delim);
    open(SCRIPT,">$script")      || die "Can't open file: $script\n";
    open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

    my $end_delimiter = {
                        '(' => ')',
                        '{' => '}',
                        '[' => ']',
                        '<' => '>',
                    }->{$delimiter} || $delimiter;

    for my $i (0 .. $#c) {

        if (($delimiter eq '=') and ($c[$i] eq '>')) {
            next;
        }
        if (($delimiter eq '$') and ($c[$i] eq '$')) {
            next;
        }
        if (($delimiter eq "'") and ($c[$i] eq '\\c[')) {
            next;
        }
        if (($delimiter eq '@') and ($c[$i] eq '\\c@')) {
            next;
        }
        if (($delimiter eq '^') and ($c[$i] eq '\\c^')) {
            next;
        }

        if ($c[$i] =~ /^([\\\$\@]|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
            print SCRIPT 'print qq', $delimiter, '\\', $c[$i], $end_delimiter, ", \"\\n\";\n";
            print WANT $want_c[$i], "\n";
        }
        else {
            print SCRIPT 'print qq', $delimiter, $c[$i], $end_delimiter, ", \"\\n\";\n";
            print WANT $want_c[$i], "\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {
            print SCRIPT 'print qq', $delimiter, chr($c1), chr($c2), $end_delimiter, ", \"\\n\";\n";
            print WANT chr($c1), chr($c2), "\n";
        }
    }

    close(SCRIPT);
    close(WANT);
}

#----------------------------------------------------------------------------
