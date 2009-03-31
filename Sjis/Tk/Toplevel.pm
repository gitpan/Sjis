package Sjis::Tk::Toplevel;
######################################################################
#
# Sjis::Tk::Toplevel - Tk Toplevel widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::Toplevel);
Tk::Widget->Construct('Toplevel');

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

sub title {
    my($self, $argv) = @_;

    $self->SUPER::title(Sjis::Encode::utf8($argv));
}

1;

__END__
