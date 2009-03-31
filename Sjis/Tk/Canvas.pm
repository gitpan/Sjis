package Sjis::Tk::Canvas;
######################################################################
#
# Sjis::Tk::Canvas - Tk Canvas widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::Canvas);
Tk::Widget->Construct('Canvas');

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

sub createText {
    my($self, $x, $y, %argv) = @_;

    if (defined $argv{'-text'}) {
        $argv{'-text'} = Sjis::Encode::utf8($argv{'-text'});
    }
    $self->SUPER::createText($x, $y, %argv);
}

1;

__END__
