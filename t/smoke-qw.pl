use strict;

mkdir('qw', 0777);

my @c = (
    (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

#----------------------------------------------------------------------------
# qw * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>\`]$/) {
        next;
    }

    my $script = sprintf("qw\\qw-%02X.pl", $delim);
    open(SCRIPT,">$script") || die "Can't open file: $script\n";

    my $end_delimiter = {
                        '(' => ')',
                        '{' => '}',
                        '[' => ']',
                        '<' => '>',
                    }->{$delimiter} || $delimiter;

    for my $c (@c) {

        if ($c !~ /^[0-9A-Za-z_\xA1-\xDF]$/) {
            next;
        }

        if ($c eq $end_delimiter) {
            next;
        }
        else {
            print SCRIPT 'qw', $delimiter, $c, $end_delimiter, ";\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {

            if (chr($c2) eq $end_delimiter) {
                next;
            }
            elsif (($delimiter eq '[') and (chr($c2) eq '[')) {
                next;
            }
            elsif (($delimiter eq '{') and (chr($c2) eq '{')) {
                next;
            }
            else {
                print SCRIPT 'qw', $delimiter, chr($c1), chr($c2), ' ', $end_delimiter, ";\n";
            }
        }
    }

    close(SCRIPT);
}

#----------------------------------------------------------------------------
