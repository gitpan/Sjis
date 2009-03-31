package Sjis::Tk::Entry55;
######################################################################
#
# Sjis::Tk::Entry55 - Tk Entry widget for ShiftJIS script
#
# Copyright (c) 2009 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;
use vars qw($VERSION);

$VERSION = sprintf '%d.%02d', q$Revision: 0.01 $ =~ m/(\d+)/xmsg;

use base qw(Tk::Derived Tk::Entry);
Tk::Widget->Construct('Entry');

use Tk;
use Sjis::Encode;
BEGIN {
    eval qq{ use Win32;      };
    eval qq{ use Win32::API; };
    eval qq{ use Tk::Pretty; };
}

use vars qw(%entry_text);
%entry_text = ();
my $entry_key = sub {
    my($e, $key) = @_;

    if ($key eq 'BackSpace') {
        my $cursor = $e->index('insert');
        if (substr($e->get(),$cursor-1,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
            $e->delete($cursor-1, $cursor);
        }
    }
    elsif ($key eq 'Delete') {
        my $cursor = $e->index('insert');
        if (substr($entry_text{$e},$cursor,1) =~ m/\A [\x81-\x9F\xE0-\xFC] \z/oxms) {
            substr($entry_text{$e}, $cursor, 2) = '';
            $e->delete(0, 'end');
            $e->insert(0, $entry_text{$e});
            $e->icursor($cursor);
        }
    }

    my @char = $e->get() =~ m/ \G ([\x81-\x9F\xE0-\xFC][\x00-\xFF] | [\x00-\xFF]) /oxmsg;
    my @length = map { length($_) } @char;
    my %point = (0, 1);
    my $cursor = 0;
    for (@length) {
        $cursor += $_;
        $point{$cursor} = 1;
    }

    if ($key =~ m/\A (?: Left | Shift-Key-Left | BackSpace ) \z/oxms) {
        my $cursor = $e->index('insert');
        while ($cursor > 0) {
            if (exists $point{$cursor}) {
                $e->icursor($cursor);
                if ($e->selectionPresent()) {
                    $e->selectionTo($cursor);
                }
                last;
            }
            $cursor--;
        }
        if ($cursor <= 0) {
            $e->icursor($e->index(0));
            if ($e->selectionPresent()) {
                $e->selectionTo($e->index(0));
            }
        }
    }
    elsif ($key =~ m/\A (?: Right | Shift-Key-Right ) \z/oxms) {
        my $cursor = $e->index('insert');
        while ($cursor < $e->index('end')) {
            if (exists $point{$cursor}) {
                $e->icursor($cursor);
                if ($e->selectionPresent()) {
                    $e->selectionTo($cursor);
                }
                last;
            }
            $cursor++;
        }
        if ($cursor >= $e->index('end')) {
            $e->icursor($e->index('end'));
            if ($e->selectionPresent()) {
                $e->selectionTo($e->index('end'));
            }
        }
    }

    $entry_text{$e} = $e->get();
};

sub ClassInit {
    my($class, $mainwindow) = @_;

    # bind here ...

    $class->SUPER::ClassInit($mainwindow);
    $mainwindow->bind('<Left>',            [ $entry_key, Ev('K') ]);
    $mainwindow->bind('<Shift-Key-Left>',  [ $entry_key, Ev('K') ]);
    $mainwindow->bind('<Right>',           [ $entry_key, Ev('K') ]);
    $mainwindow->bind('<Shift-Key-Right>', [ $entry_key, Ev('K') ]);
    $mainwindow->bind('<BackSpace>',       [ $entry_key, Ev('K') ]);
    $mainwindow->bind('<Delete>',          [ $entry_key, Ev('K') ]);
    if ($^O eq 'MSWin32') {
        $mainwindow->bind('<Key>',         [ sub {
            my($e) = @_;

            my $GetActiveWindow         = Win32::API->new('user32','GetActiveWindow',         [],        'N');
            my $GetWindowRect           = Win32::API->new('user32','GetWindowRect',           ['N','P'], 'N');
            my $ImmGetContext           = Win32::API->new('imm32', 'ImmGetContext',           ['N'],     'N');
            my $ImmReleaseContext       = Win32::API->new('imm32', 'ImmReleaseContext',       ['N','N'], 'N');
            my $ImmSetCompositionWindow = Win32::API->new('imm32', 'ImmSetCompositionWindow', ['N','P'], 'N');

            my $hWnd = $GetActiveWindow->Call();
            my $rect = "\x00" x 16;
            $GetWindowRect->Call($hWnd, $rect);
            my($rect_L, $rect_T, $rect_R, $rect_B) = unpack("llll", $rect);

            my $titleBar = $e->toplevel->overrideredirect() ?  0 : 20;
            my $menuBar  = $e->toplevel->cget('-menu')      ? 20 :  0;

            my @FONTCONF = $e->cget('-font');
            my $fontconf = Pretty(@FONTCONF);

            my $fontname;
            if ($fontconf =~ s/' \{ ((?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^' ])+) \} [ ]+ //oxms) {
                $fontname = $1;
            }
            elsif ($fontconf =~ s/' ((?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^' ])+)    [ ]+ //oxms) {
                $fontname = $1;
            }

            my $fontsize;
            if ($fontconf =~ s/ ([0-9]+) [ ]+ //oxms) {
                $fontsize = $1;
            }

            my $fontstyle;
            if ($fontconf =~ s/ \{ ((?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^' ])*) \} '//oxms) {
                $fontstyle = $1;
            }
            elsif ($fontconf =~ s/ ((?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^' ])*)    '//oxms) {
                $fontstyle = $1;
            }

            my @fontstyle = ();
            if ($fontstyle =~ m/\b bold \b/oxms) {
                push @fontstyle, ('-weight' => 'bold');
            }
            if ($fontstyle =~ m/\b italic \b/oxms) {
                push @fontstyle, ('-slant' => 'italic');
            }
            if ($fontstyle =~ m/\b underline \b/oxms) {
                push @fontstyle, ('-underline' => 1);
            }
            if ($fontstyle =~ m/\b overstrike \b/oxms) {
                push @fontstyle, ('-overstrike' => 1);
            }
            $e->fontCreate('EFONT', '-family' => $fontname, '-size' => $fontsize, @fontstyle);
            my $text = substr($e->get(), 0, $e->index('insert'));
            my $textlength = $e->fontMeasure('EFONT', $text);
            $e->fontDelete('EFONT');

            my $hIMC = $ImmGetContext->Call($hWnd);
            my $Composition = pack('LLLLllllllllllll',
                1,
                $e->rootx() - $rect_L + $textlength,
                $e->rooty() - $rect_T - $titleBar - $menuBar,
                1000,
                1000,
                1000,
                1000,
            );
            $ImmSetCompositionWindow->Call($hIMC, $Composition);
            $ImmReleaseContext->Call($hWnd, $hIMC);
        }]);
    }
}

sub Populate {
    my($self, $args) = @_;

    if (not defined $args->{'-background'} and not defined $args->{'-bg'}) {
        $args->{'-background'} = 'white';
    }
    $self->SUPER::Populate($args);

    return $self;
}

1;

__END__
