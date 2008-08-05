use strict;

mkdir('m', 0777);

my @c = (
    (map {chr($_)}                 (0x20..0x7E, 0xA1..0xDF)),
    qw( \n \r \t \f \b \a \e ),
    (map {sprintf('\\%03o',$_)}    (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\x%02x',$_)}   (0x20..0x7E, 0xA1..0xDF)),
    (map {sprintf('\\c%c',$_)}     (0x40..0x5B, 0x5D..0x5F)),
    (map {sprintf('\\x{%02x}',$_)} (0x20..0x7E, 0xA1..0xDF)),
);

my $script = "m\\m.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# / /
#----------------------------------------------------------------------------

for my $c (@c) {
    if ($c =~ /^["\\\$\@]$/) {
        print SCRIPT '$_ = "\\', $c, '"; ';
    }
    else {
        print SCRIPT '$_ = "',   $c, '"; ';
    }

    if ($c =~ /^([\/\\\$\@]|[\\\|\(\)\[\{\^\$\*\+\?\.])$/) {
        print SCRIPT "print /\\", $c, "/, \"\\n\";\n";
    }
    else {
        print SCRIPT "print /",   $c, "/, \"\\n\";\n";
    }
}

for my $c1 (0x81..0x9F, 0xE0..0xFC) {
    for my $c2 (0x40..0x7E, 0x80..0xFC) {
        print SCRIPT "\$_ = \"", chr($c1), chr($c2), "\"; print /", chr($c1), chr($c2), "/, \"\\n\";\n";
    }
}

#----------------------------------------------------------------------------
# ? ?
#----------------------------------------------------------------------------
#  
#  for my $c (@c) {
#  
#      if ($c eq '?') {
#          next;
#      }
#  
#      if ($c =~ /^["\\\$\@]$/) {
#          print SCRIPT '$_ = "\\', $c, '"; ';
#      }
#      else {
#          print SCRIPT '$_ = "',   $c, '"; ';
#      }
#  
#      if ($c =~ /^([?\\\$\@]|[\\\|\(\)\[\{\^\$\*\+\?\.])$/) {
#          print SCRIPT "print ?\\", $c, "?, \"\\n\";\n";
#      }
#      else {
#          print SCRIPT "print ?",   $c, "?, \"\\n\";\n";
#      }
#  }
#  
#  for my $c1 (0x81..0x9F, 0xE0..0xFC) {
#      for my $c2 (0x40..0x7E, 0x80..0xFC) {
#          print SCRIPT "\$_ = \"", chr($c1), chr($c2), "\"; print ?", chr($c1), chr($c2), "?, \"\\n\";\n";
#      }
#  }
#  
close(SCRIPT);

#----------------------------------------------------------------------------
# m * *
#----------------------------------------------------------------------------

for my $delim (0x20..0x7E, 0xA1..0xDF) {

    my $delimiter = chr($delim);

    if ($delimiter =~ /^[ \\0-9A-Za-z_\)\}\]\>\*\-\:\?\@\[\^\|]$/) {
        next;
    }

    my $script = sprintf("m\\m-%02X.pl", $delim);
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
        if (($delimiter eq '(') and (($c eq '(') or ($c eq ')'))) {
            next;
        }
        if (($delimiter eq '+') and ($c eq '+')) {
            next;
        }
        if (($delimiter eq "'") and ($c =~ /^\\./)) {
            next;
        }

        if ($c =~ /^["\\\$\@]$/) {
            print SCRIPT '$_ = "\\', $c, '"; ';
        }
        else {
            print SCRIPT '$_ = "',   $c, '"; ';
        }

        if ($c =~ /^([\\\$\@]|[\\\|\(\)\[\{\^\$\*\+\?\.]|\Q$delimiter\E|\Q$end_delimiter\E)$/) {
            print SCRIPT "print m", $delimiter, '\\', $c, $end_delimiter, ", \"\\n\";\n";
        }
        else {
            print SCRIPT "print m", $delimiter,       $c, $end_delimiter, ", \"\\n\";\n";
        }
    }

    for my $c1 (0x81..0x9F, 0xE0..0xFC) {
        for my $c2 (0x40..0x7E, 0x80..0xFC) {
            print SCRIPT "\$_ = \"", chr($c1), chr($c2), "\"; print m", $delimiter, chr($c1), chr($c2), $end_delimiter, ", \"\\n\";\n";
        }
    }

    close(SCRIPT);
}

#----------------------------------------------------------------------------
