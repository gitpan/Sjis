package Sjis::Tk::ROText;
######################################################################
#
# Sjis::Tk::ROText - Tk ROText widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::ROText);
Tk::Widget->Construct('ROText');

use Sjis::Encode;

sub ClassInit {
    my($class, $mainwindow) = @_;

    # bind here ...

    $class->SUPER::ClassInit($mainwindow);
}

sub Populate {
    my($self, $args) = @_;

    $self->SUPER::Populate($args);

    return $self;
}

sub insert {
    my($self, $index, @argv) = @_;

    my @utf8_argv = ();
    while (@argv > 0) {
        push @utf8_argv, Sjis::Encode::utf8(shift @argv);
        if (@argv > 0) {
            push @utf8_argv, shift @argv;
        }
    }
    $self->SUPER::insert($index, @utf8_argv);
}

sub get {
    my($self, @index) = @_;

    return Sjis::Encode::cp932($self->SUPER::get(@index));
}

1;

__END__
