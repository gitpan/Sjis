######################################################################
#
# make-euhc.pl - Source code filter for making source code filter to escape UHC
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;

for my $io (
    ['esjis.pl' => 'euhc.pl'],
    ['Esjis.pm' => 'Euhc.pm'],
    ['Sjis.pm'  => 'UHC.pm'],
) {
    my $i = $io->[0];
    my $o = $io->[1];

    print STDERR "$i --> $o\n";

    open(I,$i)    || die "Can't open file: $i\n";
    open(O,">$o") || die "Can't open file: $o\n";
	binmode(O);

    while (<I>) {
        s/\\x81-\\x9F\\xE0-\\xFC/\\x81-\\xFE/g;
        s/\\x40-\\x7E\\x80-\\xFC/\\x41-\\x5A\\x61-\\x7A\\x81-\\xFE/g;
        s/\bEsjis\b/Euhc/g;
        s/ShiftJIS/UHC/g;
        s/\besjis\.pl\b/euhc.pl/g;
        s/Sjis/UHC/g;

        print O $_;
    }

    close(I);
    close(O);
}

__END__

=pod

=head1 NAME

make-euhc.pl - Source code filter for making source code filter to escape UHC

=head1 SYNOPSIS

perl make-euhc.pl

=head1 DESCRIPTION

This utility makes euhc.pl from esjis.pl for escape UHC script.

=head1 BUGS AND LIMITATIONS

Please patches and report problems to author are welcome.

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This software is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=head1 SEE ALSO

perl, esjis.pl

=cut
