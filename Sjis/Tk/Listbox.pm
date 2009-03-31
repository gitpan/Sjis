package Sjis::Tk::Listbox;
######################################################################
#
# Sjis::Tk::Listbox - Tk Listbox widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::Listbox);
Tk::Widget->Construct('Listbox');

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

    $self->SUPER::insert($index, map { Sjis::Encode::utf8($_) } @argv);
}

sub get {
    my($self, @argv) = @_;

    my @item = $self->SUPER::get(@argv);

    if (wantarray) {
        return map { Sjis::Encode::cp932($_) } @item;
    }
    else {
        return       Sjis::Encode::cp932($item[-1]);
    }
}

1;

__END__
