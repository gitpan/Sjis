#!/usr/bin/perl -w
# $RCSfile: coloreditor.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
use Sjis;
use Tk;
use Tk::ColorEditor;
$mw = MainWindow->new();
$mw->title("Main");
# カラーを変更するためのダミー
$but = $mw->Button(-text    => "Open Color Editor",
		   -bd      => 4,
		   -command => sub { $cole->Show; })
    ->pack(-side => 'top',
	   -fill => 'both');
$lab = $mw->Label(-text   => "Label",
		  -relief => 'ridge')
    ->pack(-side => 'top',
	   -fill => 'both');
$che = $mw->Checkbutton(-text   => "Checkbutton")
    ->pack(-side => 'top',
	   -fill => 'both');
$che->invoke();
$sca = $mw->Scale(-orient => 'horizontal')
    ->pack(-side => 'top',
	   -fill => 'both');
# カラー・エディタ
$cole = $mw->ColorEditor(
			-title => 'カラーエディタ',
			-widgets => [ $but, $lab, $che, $sca ],
			 -cursor  => 'hand2');
#
MainLoop;
# ---
# coloreditor.pl
