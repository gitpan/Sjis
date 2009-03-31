package Sjis::Tk::Table;
######################################################################
#
# Sjis::Tk::Table - Tk Table widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::Table);
Tk::Widget->Construct('Table');

use Sjis::Encode;
use Tk;

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

sub put {
    my($self, $row, $col, $argv) = @_;

    if (Tk::Exists($argv)) {
        return $self->SUPER::put($row, $col, $argv);
    }
    else {
        return $self->SUPER::put($row, $col, Sjis::Encode::utf8($argv));
    }
}

sub get {
    my($self, $row, $col) = @_;

    my $get = $self->SUPER::get($row, $col);
    if (Tk::Exists($get)) {
        return $get;
    }
    else {
        return Sjis::Encode::cp932($get);
    }
}

1;

__END__
