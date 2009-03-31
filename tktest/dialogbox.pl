#!/usr/bin/perl -w
# $RCSfile: dialogbox.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
$\ = "\n";
use Sjis;
use Tk;
use Tk::DialogBox;
$mw = MainWindow->new();
$mw->title("Main");
$menu = $mw->Menu();
$mw->configure(-menu => $menu);
$menu->add('command',
	   -label => "Exit",
	   -command => \&ExitSequence);
#
MainLoop;
#
sub ExitSequence {
    $mw->bell;
    print "### ダイアログボックスが開きます。";
    # ダイアログボックス
    my $diab = $mw->DialogBox(-title          => "警告",
			      -buttons        => ['はい', 'いいえ'],
			      -default_button => 'いいえ');
    my $fra = $diab->add('Frame',
			 -borderwidth => 2,
			 -relief      => 'ridge')
	->pack(-padx => 5,
	       -pady => 5);    
    $fra->Label(-bitmap     => '@icon/exit.xbm',
		-foreground => 'red')
	->pack(-ipady => 10,
	       -side  => 'top',
	       -fill  => 'x');
    $fra->Label(-text        => "保存せず終了しますか？",
		-font        => ['ＭＳ　ゴシック', 24, 'normal'])
	->pack(-ipadx => 10,
	       -ipady => 10);
    #
    my $answer = $diab->Show;
    print "> $answer が選択されました。";
    if ($answer eq 'Yes') {
	print "> 終了します。";
	print "> ごきげんよう。";
	exit;
    } else {
	print "> アプリケーションに戻ります。";
    }
}
# ---
# dialogbox.pl
