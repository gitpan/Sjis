use strict;

mkdir('qx', 0777);

my @c = grep ! /^[ "%&(*+,.\/:;<=>?\\^a-z|]$/, (
    (map {chr($_)} (0x20..0x7E, 0xA1..0xDF)),
);

my @c1c2 = ();
for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        my $c1c2 = chr($c1) . chr($c2);

        if($c1c2 =~ /^(
            [\x81][\x41-\x7e\x80-\xac]|
            [\x81][\xb8-\xbf\xc8-\xce\xda-\xe8\xf0-\xf7\xfc]|   # *1
            [\x82][\x4f-\x58\x60-\x79\x81-\x9a\x9f-\xf1]|
            [\x83][\x40-\x7e\x80-\x96\x9f-\xb6\xbf-\xd6]|
            [\x84][\x40-\x60\x70-\x7e\x80-\x91]|
            [\x84][\x9f-\xbe]|                                  # *2
            [\x87][\x40-\x53\x5f-\x75\x7e\x80\x81\x83\x85-\x89\x8b-\x8f\x93\x94\x98\x99]|   # *3
            [\x87][\x90-\x92\x95-\x97\x9a-\x9c]|                # *4
            [\x87][\x54-\x5d\x82\x84\x8a]|                      # *5
            [\x88][\x9f-\xfc]|
            [\x89-\x97][\x40-\x7e\x80-\xfc]|
            [\x98][\x40-\x72\x9f-\xfc]|
            [\x99-\x9f][\x40-\x7e\x80-\xfc]|
            [\xe0-\xe9][\x40-\x7e\x80-\xfc]|
            [\xea][\x40-\x7e\x80-\x9e]|
            [\xea][\x9f\xa0\xa1\xa2]|                           # *6
            [\xea][\xa4]|                                       # *7
            [\xea][\xa3]|                                       # *8
            [\xed][\x40-\x7e\x80-\xfc]|                         # *9
            [\xee][\x40-\x7e\x80-\xec\xef-\xf8\xfa-\xfc]|       # *10
            [\xee][\xf9]|                                       # *11
            [\xfa][\x40-\x49\x55-\x57\x5c-\x7e\x80-\xfc]|       # *12
            [\xfa][\x54\x5b]|                                   # *13
            [\xfa][\x4a-\x53\x58-\x5a]|                         # *14
            [\xfb][\x40-\x7e\x80-\xfc]|                         # *15
            [\xfc][\x40-\x4b]                                   # *16
        )$/x){
            push @c1c2, $c1c2;
        }
    }
}

my $script = "qx\\qx.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

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

    print WANT 1, "\n";
}

for my $c1c2 (@c1c2) {
    print SCRIPT 'print `qx\\\\', $c1c2, "`;\n";
    print WANT 1, "\n";
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

    print WANT 1, "\n";
}

for my $c1c2 (@c1c2) {
    print SCRIPT 'print <<`HEREDOC`;', "\n", 'qx\\\\', $c1c2, "\nHEREDOC\n";
    print WANT 1, "\n";
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
# qx * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);
    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>]$/) {
        next;
    }

    my $script = sprintf("qx\\qx-%02X.pl", $delim);
    open(SCRIPT,">$script")      || die "Can't open file: $script\n";
    open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

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

        print WANT 1, "\n";
    }

    for my $c1c2 (@c1c2) {
        print SCRIPT 'print qx', $delimiter, 'qx\\\\', $c1c2, $end_delimiter, ";\n";
        print WANT 1, "\n";
    }

    close(SCRIPT);
    close(WANT);
}

#----------------------------------------------------------------------------
# *.BAT
#----------------------------------------------------------------------------

for my $c (@c) {
    next if -e "qx\\$c.bat";
    open(BAT,">qx\\$c.bat") || die "Can't open file: qx\\$c.bat";
    print BAT "\@echo off\n";
    print BAT "echo 1\n";
    close BAT;
}

for my $c1c2 (@c1c2) {
    open(BAT,">qx\\". $c1c2. ".bat") || die "Can't open file: qx\\", $c1c2, ".bat";
    print BAT "\@echo off\n";
    print BAT "echo 1\n";
    close BAT;
}

#----------------------------------------------------------------------------
