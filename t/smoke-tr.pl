use strict;

mkdir('tr', 0777);

my @c = (
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    qw( \n \r \t \f \b \a \e ),
    (map {sprintf('\\%03o',$_)}    (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\x%02x',$_)}   (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\c%c',$_)}     (0x40..0x5B, 0x5D..0x5F)),
    (map {sprintf('\\x{%02x}',$_)} (0x20..0x7E, 0xA1..0xDF)),
);

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>]$/) {
        next;
    }

#----------------------------------------------------------------------------
# tr ( ) * *
# tr { } * *
# tr [ ] * *
# tr < > * *
#----------------------------------------------------------------------------

    if (my $end_delimiter = {
                        '(' => ')',
                        '{' => '}',
                        '[' => ']',
                        '<' => '>',
                    }->{$delimiter}
    ) {
        for my $delim2 (0x20..0x7E, 0xA1..0xDF) {

            my $delimiter2 = chr($delim2);
            if ($delimiter2 =~ /^[ \\0-9A-Za-z_\)\}\]\>#]$/) {
                next;
            }

            my $script = sprintf("tr\\tr-%02X%02X.pl", $delim, $delim2);
            open(SCRIPT,">$script")      || die "Can't open file: $script\n";
            open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

            my $end_delimiter2 = {
                        '(' => ')',
                        '{' => '}',
                        '[' => ']',
                        '<' => '>',
                    }->{$delimiter2} || $delimiter2;

            for my $c (@c) {

                if ($c =~ /^["\\\$\@]$/) {
                    print SCRIPT '$_ = "\\', $c, '"; ';
                }
                else {
                    print SCRIPT '$_ = "',   $c, '"; ';
                }

                if ($c =~ /^([\\\-]|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
                    print SCRIPT 'print tr';
                    print SCRIPT $delimiter, '\\', $c, $end_delimiter;
                    if ($c =~ /^([\\\-]|\Q$delimiter2\E|\Q$end_delimiter2\E)$/) {
                        print SCRIPT $delimiter2, '\\', $c, $end_delimiter2;
                    }
                    else {
                        print SCRIPT $delimiter2, $c, $end_delimiter2;
                    }
                    print SCRIPT ", \"\\n\";\n";
                }
                else {
                    print SCRIPT 'print tr';
                    print SCRIPT $delimiter, $c, $end_delimiter;
                    if ($c =~ /^([\\\-]|\Q$delimiter2\E|\Q$end_delimiter2\E)$/) {
                        print SCRIPT $delimiter2, '\\', $c, $end_delimiter2;
                    }
                    else {
                        print SCRIPT $delimiter2, $c, $end_delimiter2;
                    }
                    print SCRIPT ", \"\\n\";\n";
                }

                print WANT '1', "\n";
            }

            for my $c1 (0x81..0x9F, 0xE0..0xFC) {
                for my $c2 (0x40..0x7E, 0x80..0xFC) {
                    print SCRIPT "\$_ = \"", chr($c1), chr($c2), "\"; print tr";
                    print SCRIPT $delimiter,  chr($c1), chr($c2), $end_delimiter;
                    print SCRIPT $delimiter2, chr($c1), chr($c2), $end_delimiter2;
                    print SCRIPT ", \"\\n\";\n";
                    print WANT '1', "\n";
                }
            }

            close(SCRIPT);
            close(WANT);
        }
    }

#----------------------------------------------------------------------------
# tr * * *
#----------------------------------------------------------------------------

    else {
        my $script = sprintf("tr\\tr-%02X.pl", $delim);
        open(SCRIPT,">$script")      || die "Can't open file: $script\n";
        open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

        for my $c (@c) {

            if (($delimiter eq '=') and ($c eq '>')) {
                next;
            }

            if ($c =~ /^["\\\$\@]$/) {
                print SCRIPT '$_ = "\\', $c, '"; ';
            }
            else {
                print SCRIPT '$_ = "',   $c, '"; ';
            }

            if ($c =~ /^([\\\-]|\Q$delimiter\E|\Q$delimiter\E)$/) {
                print SCRIPT 'print tr', $delimiter, '\\', $c, $delimiter, '\\', $c, $delimiter, ", \"\\n\";\n";
            }
            else {
                print SCRIPT 'print tr', $delimiter, $c, $delimiter, $c, $delimiter, ", \"\\n\";\n";
            }

            print WANT '1', "\n";
        }

        for my $c1 (0x81..0x9F, 0xE0..0xFC) {
            for my $c2 (0x40..0x7E, 0x80..0xFC) {
                print SCRIPT "\$_ = \"", chr($c1), chr($c2), "\"; print tr", $delimiter, chr($c1), chr($c2), $delimiter, chr($c1), chr($c2), $delimiter, ", \"\\n\";\n";
                print WANT '1', "\n";
            }
        }

        close(SCRIPT);
        close(WANT);
    }
}

#----------------------------------------------------------------------------
