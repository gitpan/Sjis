package Sjis::Tk::LabFrame55;
######################################################################
#
# Sjis::Tk::LabFrame55 - Tk Labeled frame widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use Carp;
use vars qw($VERSION);

$VERSION = '3.021'; # $Id: //depot/Tk8/Tixish/LabFrame.pm#21 $

#
# Labeled frame. Derives from Tk::Frame, but intercepts the labeling
# part.

use base qw(Tk::Frame);
Tk::Widget->Construct('LabFrame');

sub Populate {
    my ($cw, $args) = @_;
    my $f;
    my $label;
    my $lside = exists $args->{'-labelside'} ? delete $args->{'-labelside'} : 'top';
    #                                                                 MS Gothic
    my $lfont = exists $args->{'-font'} ? delete $args->{'-font'} : ["\x82\x6C\x82\x72\x81\x40\x83\x53\x83\x56\x83\x62\x83\x4E", 9, 'normal'];
    my $ltext = delete $args->{'-label'};
    $cw->SUPER::Populate($args);

    if ($lside =~ /acrosstop/) {
        my $border = $cw->Frame('-relief' => 'groove', '-bd' => 2);
        $cw->Advertise('border' => $border);
        my $pad = $border->Frame;
        $f = $border->Frame;
        $label = $cw->Label('-text' => $ltext, '-font' => $lfont);
        my $y = int($label->winfo('reqheight')) / 2;
        my $ph = $y - int($border->cget('-bd'));
        if ($ph < 0) {
            $ph = 0;
        }
        $label->form('-top' => 0, '-left' => 4, '-padx' => 6, '-pady' => 2);
        # $label->place(''-y'' => 2, ''-x'' => 10);
        $border->form('-top' => $y, '-bottom' => -1, '-left' => 0, '-right' => -1, '-padx' => 2, '-pady' => 2);
        $pad->form('-left' => 0, '-right' => -1, '-top' => 0, '-bottom' => $ph);
        $f->form('-top' => $pad, '-bottom' => -1, '-left' => 0, '-right' => -1);
        # $cw->Delegates('pack' => $cw);
    }
    else {
        $f = $cw->Frame('-relief' => 'groove', '-bd' => 2, %{$args});
        $label = $cw->Label('-text' => $ltext, '-font' => $lfont);
        $label->pack('-side' => $lside);
        $f->pack('-side' => $lside, '-fill' => 'both', '-expand' => 1);
    }
    $cw->Advertise('frame' => $f);
    $cw->Advertise('label' => $label);
    $cw->Delegates(DEFAULT => $f);
    $cw->ConfigSpecs('-labelside' => ['PASSIVE', 'labelSide', 'LabelSide', 'acrosstop'], 'DEFAULT' => [$f]);
}

1;

__END__
