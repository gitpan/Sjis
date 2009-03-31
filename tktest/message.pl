#!/usr/bin/perl -w
# $RCSfile: message.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
use Sjis;
use Tk;
$mw = MainWindow->new;
$mw->title("Message");
# メッセージ
$mw->Message(
	'-font' => ['ＭＳ　ゴシック', 12, 'normal'],
	'-text'       => DefineMsg(),
	'-background' => 'white')
    ->pack();
MainLoop;
#
sub DefineMsg {
    return "Within each 'release' time advances down the file, but most recent
release is at the top.

Change.log is generated from perforce database, it is therefore
complete, but short on detail.

ここに日本語を書く

Changes in Tk800.015
	Event Loop is now usable as separate loadable 
	Major work on Text, TextUndo by  
	Lots of work on Drag&Drop
	  - XDND protocol 
	  - KDE/kfm protocol 
	  - Sun version window manager independant.
	Support for images as icons (Win32 and Unix)
	Tk::Pane and Tk::ProgressBar bundled.
	Fixes to Photo's ->put 
	UNIX filevent overhaul
	Patches from the list as ever. 
	Support for perl5.005_57+";
}
# ---
# message.pl


