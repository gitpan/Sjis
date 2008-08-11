use strict;

mkdir('reverse', 0777);

my @c = (
    [qw(ABCDE FGHIJ KLMNO )],
    [qw(あいうえお かきくけこ さしすせそ )],
);

my @reverse_c = (
    '(KLMNO)(FGHIJ)(ABCDE)',
    '(さしすせそ)(かきくけこ)(あいうえお)',
);

my @scalar_reverse_c = (
    'ONMLKJIHGFEDCBA', 
    'そせすしさこけくきかおえういあ',
);

my $script = "reverse\\reverse.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# reverse @_
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    print SCRIPT "\@_ = (", "'", $c[$i]->[0], "','", $c[$i]->[1], "','", $c[$i]->[2], "'", "); print map {qq{(\$_)}} reverse \@_; print \"\\n\";\n";
    print WANT $reverse_c[$i], "\n";
}

#----------------------------------------------------------------------------
# reverse(@_)
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    print SCRIPT "\@_ = (", "'", $c[$i]->[0], "','", $c[$i]->[1], "','", $c[$i]->[2], "'", "); print map {qq{(\$_)}} reverse(\@_); print \"\\n\";\n";
    print WANT $reverse_c[$i], "\n";
}

#----------------------------------------------------------------------------
# scalar reverse @_
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    print SCRIPT "\@_ = (", "'", $c[$i]->[0], "','", $c[$i]->[1], "','", $c[$i]->[2], "'", "); print scalar reverse \@_; print \"\\n\";\n";
    print WANT $scalar_reverse_c[$i], "\n";
}

#----------------------------------------------------------------------------
# scalar reverse(@_)
#----------------------------------------------------------------------------

for my $i (0 .. $#c) {
    print SCRIPT "\@_ = (", "'", $c[$i]->[0], "','", $c[$i]->[1], "','", $c[$i]->[2], "'", "); print scalar reverse(\@_); print \"\\n\";\n";
    print WANT $scalar_reverse_c[$i], "\n";
}

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
