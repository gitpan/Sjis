#!/usr/bin/perl -w
# $RCSfile: dialog.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
$\ = "\n";
use Sjis;
use Tk;
use Tk::Dialog;
$mw = MainWindow->new();
$mw->title("Main");
$menu = $mw->Menu();
# Toplevel $mw のオプション -menu を定義。
$mw->configure(-menu => $menu);
# メニューバーのエントリ
$menu->add('command',
	   -label => "Exit",
	   -command => \&ExitSequence);
#
MainLoop;
# 終了確認のダイアログを開く。
sub ExitSequence {
    $mw->bell;
    print "### ダイアログが開きます。";
    # ダイアログ
    my $dialog = $mw->Dialog(-title          => "警告",
			     -bitmap         => "warning",
			     -text           => "保存せずに終了しますか？",
			     -buttons        => ['はい', 'いいえ'],
			     -default_button => 'いいえ');
    my $answer = $dialog->Show;
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
# dialog.pl
