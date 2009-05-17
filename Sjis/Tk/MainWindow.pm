package Sjis::Tk::MainWindow;
######################################################################
#
# Sjis::Tk::MainWindow - Tk::MainWindow for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION @ISA);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use Tk;
@ISA = qw(MainWindow);

use Sjis::Encode;

sub new {
    my($class, @argv) = @_;
    return bless MainWindow->new(@argv), $class;
}

sub title {
    my($self, $argv) = @_;
    return $self->SUPER::title(Sjis::Encode::utf8($argv));
}

sub getOpenFile {
    my($self, @argv) = @_;
    return Sjis::Encode::cp932($self->SUPER::getOpenFile(@argv));
}

sub getSaveFile {
    my($self, @argv) = @_;
    return Sjis::Encode::cp932($self->SUPER::getSaveFile(@argv));
}

1;

__END__
